plot_uncertainty <- function(observed,obs,x,s,scenarios,metrics,out='figures/generated') {
 library(ggplot2)
 paper <- '#FAF8F2'; ink <- '#172E3B'; teal <- '#237A87'; rust <- '#B64C2E'; grey <- '#657174'
 th <- theme_minimal(base_size=21,base_family='Helvetica') + theme(
  text=element_text(colour=ink),axis.text=element_text(colour=ink,size=17),
  panel.grid.minor=element_blank(),panel.grid.major=element_line(colour='#DDDED6',linewidth=.3),
  plot.background=element_rect(fill=paper,colour=NA),panel.background=element_rect(fill=paper,colour=NA),
  legend.position='none',strip.text=element_text(size=19,face='bold'),plot.margin=margin(12,20,12,15))
 save <- function(p,name,w=11.5,h=3.7) ggsave(file.path(out,paste0('unc-',name,'.png')),p,width=w,height=h,dpi=160,
  device=function(filename,width,height,res,...) png(filename,width=width,height=height,units='in',res=res,type=if(Sys.info()[['sysname']]=='Darwin') 'quartz' else 'cairo',...))
 label <- 'Paired change: Q minus vehicle (U/mg protein)'
 p <- ggplot(observed,aes(difference,0))+geom_vline(xintercept=obs$mean,colour=rust,linewidth=1)+
  geom_point(size=4.5,colour=ink)+geom_text(aes(label=preparation),vjust=-1.3,size=6,colour=grey)+
  annotate('text',x=obs$mean,y=-.33,label=sprintf('This experiment’s mean: %.1f',obs$mean),colour=rust,size=7)+
  scale_x_continuous(limits=c(-30,12),breaks=c(-20,-10,0,10))+coord_cartesian(ylim=c(-.55,.3))+
  labs(x=label,y=NULL)+th+theme(axis.text.y=element_blank(),axis.ticks.y=element_blank(),panel.grid=element_blank())
 save(p,'observed',h=2.6)
 d <- data.frame(experiment=factor(rep(paste('Repeat',1:3),each=6),levels=rev(paste('Repeat',1:3))),change=as.vector(t(x[1:3,])))
 means <- aggregate(change~experiment,d,mean)
 p <- ggplot(d,aes(change,experiment))+geom_point(colour=ink,size=3.3)+
  geom_point(data=means,aes(y=as.numeric(experiment)-.18),shape=18,size=6,colour=rust)+
  geom_text(data=means,aes(label=sprintf('mean %.1f',change)),nudge_y=.3,colour=rust,size=5.5)+
  scale_x_continuous(limits=c(-45,15))+labs(x=label,y=NULL)+th+theme(panel.grid.major.y=element_blank())
 save(p,'three-repeats')
 for (k in c(10,100,10000)) {
  d <- s[seq_len(k),]
  p <- ggplot(d,aes(mean))+geom_histogram(aes(y=after_stat(count/sum(count))),binwidth=1,boundary=0,fill=teal,colour=paper)+
   geom_vline(xintercept=-14,colour=rust,linewidth=1)+
   annotate('text',x=-13,y=.23,label='Fixed simulated mean: −14',hjust=0,size=5.5,colour=rust)+
   coord_cartesian(xlim=c(-32,4),ylim=c(0,.25))+labs(x='Mean paired change from one experiment (U/mg)',y='Fraction of experiments',title=paste(format(k,big.mark=','),'repeated experiments · six preparations each'))+th+theme(plot.title=element_text(size=18),axis.title=element_text(size=17))
  save(p,paste0('means-',k))
 }
 d <- rbind(data.frame(value=as.vector(x),kind='Preparation responses'),data.frame(value=s$mean,kind='Experiment means'))
 d$kind <- factor(d$kind,levels=c('Preparation responses','Experiment means'))
 p <- ggplot(d,aes(value))+geom_histogram(aes(y=after_stat(density)),binwidth=2,boundary=0,fill=teal,colour=paper)+
  geom_vline(xintercept=-14,colour=rust,linewidth=.8)+facet_wrap(~kind,nrow=1)+
  coord_cartesian(xlim=c(-50,22),ylim=c(0,.11))+labs(x='Q minus vehicle (U/mg)',y='Relative density')+th
 save(p,'sd-se')
 scenarios$scenario <- factor(scenarios$scenario,levels=c('Original: n = 6','More biological variation: n = 6','More preparations: n = 24'))
 p <- ggplot(scenarios,aes(mean))+geom_histogram(aes(y=after_stat(density)),binwidth=1,boundary=0,fill=teal,colour=paper)+
  geom_vline(xintercept=-14,colour=rust,linewidth=.8)+facet_wrap(~scenario,nrow=1)+
  coord_cartesian(xlim=c(-40,12),ylim=c(0,.21))+labs(x='Estimated mean paired change (U/mg)',y='Relative density')+th+theme(strip.text=element_text(size=14))
 save(p,'precision',h=3.6)
 ci_plot <- function(d,truth=FALSE) {
  p <- ggplot(d,aes(mean,experiment))+geom_segment(aes(x=lower,xend=upper,yend=experiment),colour=teal,linewidth=1.4)+geom_point(colour=ink,size=4)+labs(x='Mean paired change (U/mg)',y=NULL)+th
  if(truth) p <- p+geom_vline(xintercept=-14,colour=rust,linewidth=.9)
  p
 }
 one <- transform(obs,experiment='Our experiment')
 save(ci_plot(one)+coord_cartesian(xlim=c(-32,12))+theme(panel.grid.major.y=element_blank()),'observed-ci',h=2.5)
 d <- s[1:60,]; d$kind <- ifelse(d$covered,'Contains true mean','Misses true mean')
 p <- ggplot(d,aes(mean,experiment,colour=kind))+geom_vline(xintercept=-14,colour=ink,linewidth=.8)+
  geom_segment(aes(x=lower,xend=upper,yend=experiment),linewidth=.65)+geom_point(size=1.5)+
  scale_colour_manual(values=c('Contains true mean'=teal,'Misses true mean'=rust))+
  scale_y_reverse(breaks=c(1,20,40,60))+coord_cartesian(xlim=range(c(d$lower,d$upper)))+
  labs(x='95% interval for the mean paired change (U/mg)',y='Repeated experiment')+th
 save(p,'coverage',h=4.3)
 d <- data.frame(experiment=factor(c('Wide interval','Narrow interval'),levels=c('Narrow interval','Wide interval')),mean=c(-10,-10),lower=c(-25,-13),upper=c(5,-7))
 save(ci_plot(d)+coord_cartesian(xlim=c(-35,8))+theme(panel.grid.major.y=element_blank()),'width',h=3)
 d <- data.frame(experiment=factor(c('Large estimate · imprecise','Small estimate · precise'),levels=c('Small estimate · precise','Large estimate · imprecise')),mean=c(-20,-3),lower=c(-38,-4),upper=c(-2,-2))
 save(ci_plot(d)+coord_cartesian(xlim=c(-42,5))+theme(panel.grid.major.y=element_blank()),'magnitude',h=3)
}
