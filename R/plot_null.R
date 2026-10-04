plot_null <- function(x,sim,obs,out='figures/generated') {
 library(ggplot2)
 paper <- '#FAF8F2';ink <- '#172E3B';teal <- '#237A87';rust <- '#B64C2E';grey <- '#657174'
 th <- theme_minimal(base_size=20,base_family='Helvetica')+theme(text=element_text(colour=ink),axis.text=element_text(colour=ink,size=17),axis.title=element_text(size=17),plot.title=element_text(size=18),panel.grid.minor=element_blank(),panel.grid.major=element_line(colour='#DDDED6',linewidth=.3),plot.background=element_rect(fill=paper,colour=NA),panel.background=element_rect(fill=paper,colour=NA),legend.position='none',plot.margin=margin(12,20,12,15))
 save <- function(p,name,h=3.7) ggsave(file.path(out,paste0('null-',name,'.png')),p,width=11.5,height=h,dpi=160,device=function(filename,width,height,res,...) png(filename,width=width,height=height,units='in',res=res,type=if(Sys.info()[['sysname']]=='Darwin') 'quartz' else 'cairo',...))
 d <- data.frame(experiment=factor(rep(paste('Repeat',1:3),each=6),levels=rev(paste('Repeat',1:3))),change=as.vector(t(x[1:3,])))
 means <- aggregate(change~experiment,d,mean)
 p <- ggplot(d,aes(change,experiment))+geom_vline(xintercept=0,colour=grey,linewidth=.8)+geom_point(colour=ink,size=3.3)+geom_point(data=means,aes(y=as.numeric(experiment)-.18),shape=18,size=6,colour=rust)+geom_text(data=means,aes(label=sprintf('mean %+.1f',change)),nudge_y=.3,size=5.5,colour=rust)+coord_cartesian(xlim=c(-30,30))+labs(x='Paired change: Q minus vehicle (U/mg)',y=NULL)+th
 save(p,'three-repeats')
 histmean <- function(k,observed=FALSE) {
  p <- ggplot(sim[seq_len(k),],aes(mean))+geom_histogram(aes(y=after_stat(count/sum(count))),binwidth=1,boundary=0,fill=teal,colour=paper)+geom_vline(xintercept=0,colour=ink,linewidth=.8)+coord_cartesian(xlim=c(-18,18),ylim=c(0,.25))+labs(x='Mean paired change from one experiment (U/mg)',y='Fraction of experiments',title=paste(format(k,big.mark=','),'experiments · true mean zero · six preparations each'))+th
  if(observed) p <- p+geom_vline(xintercept=obs$mean,colour=rust,linewidth=1.1)+annotate('text',x=obs$mean-.5,y=.22,label='Observed\n−10.4',hjust=1,size=5.5,colour=rust)
  p
 }
 for(k in c(10,100,10000)) save(histmean(k),paste0('means-',k))
 save(histmean(10000,TRUE),'observed-mean')
 d <- data.frame(y=c(2,1),se=c(2,10),label=c('SE 2 U/mg','SE 10 U/mg'))
 p <- ggplot(d,aes(x=obs$mean,y=y))+geom_vline(xintercept=0,colour=grey,linewidth=.8)+geom_segment(aes(x=obs$mean-se,xend=obs$mean+se,yend=y),colour=teal,linewidth=1.5)+geom_point(size=4,colour=ink)+scale_y_continuous(breaks=d$y,labels=d$label)+coord_cartesian(xlim=c(-24,4))+labs(x='Same estimated mean: −10.4 U/mg',y=NULL)+th
 save(p,'same-mean',h=2.9)
 d <- data.frame(x=c(obs$mean,obs$mean+obs$se,obs$mean+2*obs$se))
 p <- ggplot()+geom_segment(aes(x=obs$mean,xend=0,y=0,yend=0),colour=grey,linewidth=.8)+geom_point(aes(x=obs$mean,y=0),size=5,colour=rust)+geom_point(aes(x=0,y=0),size=4,colour=ink)+geom_segment(data=d[1:2,,drop=FALSE],aes(x=x,xend=x+obs$se,y=.16,yend=.16),colour=teal,linewidth=2)+geom_segment(data=d,aes(x=x,xend=x,y=.12,yend=.20),colour=teal,linewidth=.8)+annotate('text',x=obs$mean+obs$se/2,y=.30,label='1 SE',size=6,colour=teal)+annotate('text',x=obs$mean+1.5*obs$se,y=.30,label='1 SE',size=6,colour=teal)+annotate('text',x=obs$mean,y=-.20,label='Observed −10.4',hjust=.5,size=6,colour=rust)+annotate('text',x=0,y=-.20,label='Null 0',size=6,colour=ink)+coord_cartesian(xlim=c(-14,3),ylim=c(-.4,.5))+labs(x='Mean paired change (U/mg)',y=NULL)+th+theme(axis.text.y=element_blank(),panel.grid.major.y=element_blank())
 save(p,'se-steps',h=2.7)
 curve <- data.frame(z=seq(-7,7,length.out=2801));curve$t <- dt(curve$z,5);curve$normal <- dnorm(curve$z)
 p <- ggplot(sim,aes(t))+geom_histogram(aes(y=after_stat(density)),binwidth=.25,boundary=0,fill='#BDD4D3',colour=paper)+geom_line(data=curve,aes(z,t),colour=teal,linewidth=1)+geom_line(data=curve,aes(z,normal),colour=grey,linetype='dashed',linewidth=.8)+coord_cartesian(xlim=c(-5,5),ylim=c(0,.42))+labs(x='Standardized statistic: mean / estimated SE',y='Relative density')+th
 save(p,'t-distribution')
 p <- ggplot(curve,aes(z,t))+geom_area(data=subset(curve,z<=-abs(obs$t)),fill=rust,alpha=.75)+geom_area(data=subset(curve,z>=abs(obs$t)),fill=rust,alpha=.75)+geom_line(colour=teal,linewidth=1)+geom_vline(xintercept=c(-abs(obs$t),abs(obs$t)),colour=rust,linetype='dashed',linewidth=.7)+annotate('text',x=-abs(obs$t),y=.28,label='Observed −2.10',hjust=1.05,size=5,colour=rust)+annotate('text',x=abs(obs$t),y=.28,label='+2.10',hjust=-.05,size=5,colour=rust)+coord_cartesian(xlim=c(-5,5),ylim=c(0,.42))+labs(x='t statistic under H₀ · 5 degrees of freedom',y='Relative density')+th
 save(p,'two-tails')
 d <- data.frame(mean=obs$mean,lower=obs$lower,upper=obs$upper,y=0)
 p <- ggplot(d,aes(mean,y))+geom_vline(xintercept=0,colour=grey,linewidth=1)+geom_segment(aes(x=lower,xend=upper,yend=y),colour=teal,linewidth=1.5)+geom_point(colour=ink,size=4.5)+annotate('text',x=0,y=.3,label='Null value 0',hjust=.6,size=5.5,colour=grey)+coord_cartesian(xlim=c(-32,12),ylim=c(-.5,.5))+labs(x='Mean paired change (U/mg) · 95% paired t interval',y=NULL)+th+theme(axis.text.y=element_blank(),panel.grid.major.y=element_blank())
 save(p,'ci-zero',h=2.6)
 # Unselected first 100 null repetitions; a symbol per testing decision, not per preparation.
 d <- sim[1:100,];d$x <- ((d$experiment-1)%%20)+1;d$y <- 5-floor((d$experiment-1)/20);d$reject <- d$p<.05
 p <- ggplot(d,aes(x,y,colour=reject,shape=reject))+geom_point(size=5)+scale_colour_manual(values=c(teal,rust))+scale_shape_manual(values=c(16,4))+coord_fixed(xlim=c(.5,20.5),ylim=c(.5,5.5))+th+theme(axis.text=element_blank(),axis.title=element_blank(),panel.grid=element_blank())
 save(p,'decisions',h=2.6)
}
