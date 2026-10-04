// Author-only browser QA. Requires Playwright and an installed Chrome.
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const fs = require('fs');
const path = require('path');
(async () => {
  const browser = await chromium.launch({headless:true, executablePath: process.env.CHROME_PATH || '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'});
  const page = await browser.newPage({viewport:{width:1440,height:900},deviceScaleFactor:1});
  const errors=[]; const remote=[];
  page.on('pageerror', e => errors.push(e.message));
  page.on('request', r => {if (/^https?:/.test(r.url())) remote.push(r.url());});
  await page.goto('file://'+path.resolve('_output/session-1.html'));
  await page.waitForFunction(() => window.Reveal && Reveal.isReady());
  const count=await page.evaluate(()=>Reveal.getTotalSlides());
  const findings=[];
  fs.mkdirSync('tmp/qa',{recursive:true});
  for(let i=0;i<count;i++) {
    await page.evaluate(i=>Reveal.slide(i,0,-1),i);
    await page.waitForTimeout(600);
    await page.screenshot({path:`tmp/qa/slide-${String(i+1).padStart(2,'0')}-initial.png`});
    await page.evaluate(()=>{ for(let j=0;j<20;j++) Reveal.nextFragment(); });
    await page.waitForTimeout(600);
    const info=await page.evaluate(()=>{
      const s=Reveal.getCurrentSlide(), b=s.getBoundingClientRect();
      const elements=[...s.querySelectorAll('*')].filter(e=>!e.closest('aside.notes') && !['SCRIPT','STYLE'].includes(e.tagName));
      const outside=elements.filter(e=>{const x=e.getBoundingClientRect();return x.width>0 && x.height>0 && (x.right>b.right+2 || x.bottom>b.top+720*Reveal.getScale()+2 || x.left<b.left-2);}).map(e=>e.tagName+'.'+e.className);
      return {title:s.querySelector('h2')?.textContent, notes:!!s.querySelector('aside.notes'),outside,
        code:s.querySelectorAll('pre,code').length,
        brokenImages:[...s.querySelectorAll('img')].filter(im=>!im.complete || im.naturalWidth===0).length,
        height:s.scrollHeight};
    });
    findings.push({slide:i+1,...info});
    await page.screenshot({path:`tmp/qa/slide-${String(i+1).padStart(2,'0')}.png`});
  }
  // A second aspect ratio catches common projector layout problems.
  await page.setViewportSize({width:1280,height:720});
  await page.evaluate(()=>Reveal.slide(0));
  await page.waitForTimeout(600);
  await page.screenshot({path:'tmp/qa/widescreen-opening.png'});
  const result={count,errors,remote,slides:findings};
  fs.writeFileSync('tmp/qa/report.json',JSON.stringify(result,null,2));
  console.log(JSON.stringify(result,null,2));
  await browser.close();
  if(count!==64 || errors.length || remote.length || findings.some(x=>!x.notes || x.code || x.brokenImages || x.outside.length)) process.exitCode=1;
})();
