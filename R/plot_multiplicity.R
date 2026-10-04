plot_multiplicity<-function(p,holm,bh,perf,selection,metrics,out='figures/generated') {
 library(ggplot2)
 paper<-'#FAF8F2';ink<-'#172E3B';teal<-'#237A87';rust<-'#B64C2E';grey<-'#657174'
 th<-theme_minimal(base_size=20,base_family='Helvetica')+theme(text=element_text(colour=ink),axis.text=element_text(colour=ink,size=16),axis.title=element_text(size=17),plot.title=element_text(size=18),panel.grid.minor=element_blank(),panel.grid.major=element_line(colour='#DDDED6',linewidth=.3),plot.background=element_rect(fill=paper,colour=NA),panel.background=element_rect(fill=paper,colour=NA),legend.position='none',plot.margin=margin(12,20,12,15))
 save<-function(g,name,h=3.7,w=11.5) ggsave(file.path(out,paste0('multi-',name,'.png')),g,width=w,height=h,dpi=160,device=function(filename,width,height,res,...) png(filename,width=width,height=height,units='in',res=res,type=if(Sys.info()[['sysname']]=='Darwin') 'quartz' else 'cairo',...))
 for(i in 1:3) {
  d<-data.frame(marker=1:20,p=p[i,]);g<-ggplot(d,aes(marker,p,colour=p<.05))+geom_hline(yintercept=.05,colour=rust,linetype='dashed')+geom_point(size=4)+scale_colour_manual(values=c(teal,rust))+scale_x_continuous(breaks=seq(1,20,by=1))+scale_y_continuous(limits=c(0,1),breaks=c(.05,.25,.5,.75,1))+labs(x='L1 outcome / marker',y='Raw p-value',title=paste('Simulated experiment',i,'· all 20 nulls true'))+th+theme(axis.text.x=element_text(size=13))
  save(g,paste0('twenty-',i))
 }
 d<-data.frame(experiment=1:100,hit=rowSums(p[1:100,]<.05)>0);d$x<-(d$experiment-1)%%20+1;d$y<-5-floor((d$experiment-1)/20)
 g<-ggplot(d,aes(x,y,colour=hit,shape=hit))+geom_point(size=5)+scale_colour_manual(values=c(teal,rust))+scale_shape_manual(values=c(16,4))+coord_fixed(xlim=c(.5,20.5),ylim=c(.5,5.5))+th+theme(axis.text=element_blank(),axis.title=element_blank(),panel.grid=element_blank())
 save(g,'families',h=2.7)
 d<-data.frame(rank=rep(holm$rank,2),value=c(holm$p,holm$p),method=rep(c('Bonferroni: same cutoff','Holm: stop at first failure'),each=5),threshold=c(rep(.01,5),holm$step_threshold))
 g<-ggplot(d,aes(rank,value))+geom_line(aes(y=threshold),colour=teal,linewidth=1)+geom_point(size=4,colour=ink)+facet_wrap(~method,nrow=1)+scale_x_continuous(breaks=1:5)+scale_y_continuous(limits=c(0,.21),breaks=c(0,.01,.05,.1,.2))+labs(x='Ordered hypothesis',y='Raw p-value')+th+theme(strip.text=element_text(size=17,face='bold'))
 save(g,'holm')
 # Expected-count illustration: each dot represents 100 outcomes. This is an expectation, not simulated data.
 d<-data.frame(x=rep(1:20,10),y=rep(10:1,each=20),expected=1:200<=10)
 g<-ggplot(d,aes(x,y,colour=expected))+geom_point(size=4)+scale_colour_manual(values=c('#CCD5D1',rust))+coord_fixed()+th+theme(axis.text=element_blank(),axis.title=element_blank(),panel.grid=element_blank())
 save(g,'genes',h=3.2)
 d<-perf[perf$method=='BH' & perf$experiment<=80,]
 g<-ggplot(d,aes(experiment,100*fdp))+geom_hline(yintercept=100*metrics$mixed_bh_fdr,colour=teal,linewidth=.8)+geom_segment(aes(xend=experiment,yend=0),colour=rust)+geom_point(aes(colour=fdp>0),size=2.5)+scale_colour_manual(values=c(teal,rust))+coord_cartesian(ylim=c(0,100))+labs(x='Repeated discovery screen',y='False fraction in its list (%)')+th
 save(g,'fdp',h=3.2)
 g<-ggplot(bh,aes(rank,p))+geom_line(aes(y=threshold),colour=teal,linewidth=1)+geom_point(aes(colour=rank<=4),size=4)+scale_colour_manual(values=c(ink,rust))+scale_x_continuous(breaks=1:8)+scale_y_continuous(limits=c(0,.82),breaks=c(0,.05,.2,.4,.6,.8))+labs(x='Rank of ordered p-value',y='Raw p-value')+th
 # Split scale avoided: an inset-like zoom on the relevant range, with all values stated separately on slide.
 g<-ggplot(bh,aes(rank,p))+geom_line(aes(y=threshold),colour=teal,linewidth=1)+geom_point(aes(colour=rank<=4),size=4)+scale_colour_manual(values=c(ink,rust))+scale_x_continuous(breaks=1:8)+coord_cartesian(ylim=c(0,.085))+labs(x='Rank of ordered p-value',y='Raw p-value (zoom to 0.085)')+th
 save(g,'bh')
 d<-rbind(data.frame(value=selection$single,type='One prespecified test'),data.frame(value=selection$minimum,type='Smallest of five chances'))
 g<-ggplot(d,aes(value))+geom_histogram(aes(y=after_stat(density)),binwidth=.05,boundary=0,fill=teal,colour=paper)+geom_vline(xintercept=.05,colour=rust,linetype='dashed')+facet_wrap(~type,nrow=1)+labs(x='Reported p-value',y='Relative density')+th+theme(strip.text=element_text(size=17,face='bold'))
 save(g,'selection')
}
