plot_power <- function(x,s,examples,curves,precision,design,wells,grid,metrics,out='figures/generated') {
 library(ggplot2)
 paper<-'#FAF8F2';ink<-'#172E3B';teal<-'#237A87';rust<-'#B64C2E';grey<-'#657174'
 th<-theme_minimal(base_size=20,base_family='Helvetica')+theme(text=element_text(colour=ink),axis.text=element_text(colour=ink,size=16),axis.title=element_text(size=17),plot.title=element_text(size=18),panel.grid.minor=element_blank(),panel.grid.major=element_line(colour='#DDDED6',linewidth=.3),plot.background=element_rect(fill=paper,colour=NA),panel.background=element_rect(fill=paper,colour=NA),legend.position='none',plot.margin=margin(12,20,12,15))
 save<-function(p,name,h=3.7,w=11.5) ggsave(file.path(out,paste0('power-',name,'.png')),p,width=w,height=h,dpi=160,device=function(filename,width,height,res,...) png(filename,width=width,height=height,units='in',res=res,type=if(Sys.info()[['sysname']]=='Darwin') 'quartz' else 'cairo',...))
 selected<-examples$experiment
 exampleplot<-function(ids) {
  z<-s[ids,];z$row<-rev(seq_along(ids));z$label<-sprintf('Repeat %d: mean %.1f\n95%% CI [%.1f, %.1f] · p = %.3f',z$experiment,z$mean,z$lower,z$upper,z$p)
  d<-data.frame(value=as.vector(t(x[ids,,drop=FALSE])),row=rep(z$row,each=6))
  ggplot()+geom_vline(xintercept=-14,colour=grey,linetype='dashed')+geom_vline(xintercept=0,colour=grey,linewidth=.5)+geom_point(data=d,aes(value,row+.16),size=3,colour=ink)+geom_segment(data=z,aes(x=lower,xend=upper,y=row-.08,yend=row-.08),colour=teal,linewidth=1.3)+geom_point(data=z,aes(mean,row-.08),shape=18,size=5,colour=rust)+scale_y_continuous(breaks=z$row,labels=z$label)+coord_cartesian(xlim=c(-42,18),ylim=c(.55,length(ids)+.5))+labs(x='Q minus vehicle (U/mg)',y=NULL)+th+theme(panel.grid.major.y=element_blank(),axis.text.y=element_text(size=16))
 }
 save(exampleplot(selected),'examples',h=3.5)
 save(exampleplot(selected[2]),'nonrejection',h=2.6)
 d<-s[1:100,];d$x<-((d$experiment-1)%%20)+1;d$y<-5-floor((d$experiment-1)/20)
 p<-ggplot(d,aes(x,y,colour=reject,shape=reject))+geom_point(size=5)+scale_colour_manual(values=c(teal,rust))+scale_shape_manual(values=c(16,4))+coord_fixed(xlim=c(.5,20.5),ylim=c(.5,5.5))+th+theme(axis.text=element_blank(),axis.title=element_blank(),panel.grid=element_blank())
 save(p,'decisions',h=2.6)
 # Each curve varies one factor; all other parameters fixed at the baseline in notes.
 for(i in 1:4) {
  d<-curves[curves$factor==unique(curves$factor)[i],]
  p<-ggplot(d,aes(value,100*power))+geom_line(colour=teal,linewidth=1.2)+scale_y_continuous(limits=c(0,100),breaks=c(0,50,100))+labs(x=unique(d$factor),y='Power (%)')+th
  save(p,paste0('factor-',i),h=3.5)
 }
 p<-ggplot(precision,aes(n,se))+geom_line(colour=teal,linewidth=1)+geom_point(colour=ink,size=4)+geom_text(aes(label=sprintf('%.2f',se)),vjust=-1,size=6,colour=ink)+scale_x_continuous(breaks=precision$n)+coord_cartesian(ylim=c(0,7))+labs(x='Independent preparation pairs',y='SE of mean change (U/mg)')+th
 save(p,'precision')
 p<-ggplot(design,aes(mean))+geom_histogram(aes(y=after_stat(density)),binwidth=2,boundary=0,fill=teal,colour=paper)+geom_vline(xintercept=-14,colour=rust)+facet_wrap(~design,nrow=1)+coord_cartesian(xlim=c(-48,20),ylim=c(0,.105))+labs(x='Estimated mean effect (U/mg)',y='Relative density')+th+theme(strip.text=element_text(size=17,face='bold'))
 save(p,'design')
 wells$option<-factor(wells$option,levels=rev(wells$option));wells$relative<-100*wells$se/(metrics$difference_sd/sqrt(6))
 p<-ggplot(wells,aes(relative,option))+geom_point(colour=teal,size=5)+geom_text(aes(label=sprintf('%.1f%%',relative)),nudge_y=.25,size=6,colour=ink)+coord_cartesian(xlim=c(85,103))+labs(x='SE relative to current experiment (%)',y=NULL)+th+theme(panel.grid.major.y=element_blank(),axis.text.y=element_text(size=16))
 save(p,'wells',h=3)
 grid$effect_f<-factor(grid$effect);grid$sd_f<-factor(grid$difference_sd,levels=rev(sort(unique(grid$difference_sd))))
 p<-ggplot(grid,aes(effect_f,sd_f))+geom_tile(fill='#E4ECE7',colour=paper,linewidth=3)+geom_text(aes(label=n),size=10,colour=ink)+labs(x='Assumed minimum relevant effect magnitude (U/mg)',y='SD of paired changes\n(U/mg)')+th+theme(panel.grid=element_blank())
 save(p,'sensitivity',h=3.6)
}
