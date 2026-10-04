# All plots are exported offline. Content displays no R code or numerical inference.
plot_descriptive <- function(paired, extreme, toy, out = "figures/generated") {
  library(ggplot2)
  paper <- "#FAF8F2"; ink <- "#172E3B"; teal <- "#237A87"; rust <- "#B64C2E"
  muted <- "#657174"; gold <- "#8E6516"
  theme_d <- theme_minimal(base_size = 20, base_family = "Helvetica") +
    theme(text = element_text(colour = ink),
          plot.background = element_rect(fill = paper, colour = NA),
          panel.background = element_rect(fill = paper, colour = NA),
          panel.grid.minor = element_blank(), panel.grid.major = element_line(colour = "#DDDED6", linewidth = .3),
          axis.text = element_text(colour = ink, size = 17),
          axis.title = element_text(size = 18),
          strip.text = element_text(size = 20, face = "bold", colour = ink),
          legend.position = "none", plot.margin = margin(12, 20, 12, 12))
  save <- function(p, name, w=11.5, h=4.3) {
    ggsave(file.path(out,paste0(name,".png")),p,width=w,height=h,dpi=180,
      device=function(filename,width,height,res,...) {
        grDevices::png(filename,width=width,height=height,units="in",res=res,
          type=if(Sys.info()[["sysname"]]=="Darwin") "quartz" else "cairo",...)
      })
  }
  long <- rbind(data.frame(preparation=paired$preparation, condition="Vehicle",value=paired$vehicle),
                data.frame(preparation=paired$preparation, condition="Compound Q",value=paired$compound))
  long$condition <- factor(long$condition,levels=c("Vehicle","Compound Q"))
  p <- ggplot(long,aes(condition,value,group=preparation))+
    geom_line(colour="#A2AAA8",linewidth=.8)+
    geom_point(aes(colour=condition,shape=condition),size=4.3)+
    facet_wrap(~preparation,nrow=1)+scale_colour_manual(values=c(teal,rust))+
    scale_shape_manual(values=c(16,17))+scale_x_discrete(labels=c("V","Q"))+
    scale_y_continuous(breaks=seq(60,120,20))+labs(x=NULL,y="Enzyme activity (U/mg protein)")+
    theme_d+theme(panel.grid.major.x=element_blank())
  save(p,"bio-pairs")
  change_plot <- function(dat) {
    ggplot(dat,aes(difference,preparation))+
      geom_vline(xintercept=0,colour=muted,linetype="dashed",linewidth=.6)+
      geom_segment(aes(x=0,xend=difference,yend=preparation),colour="#ABB3B0",linewidth=1)+
      geom_point(size=4.2,colour=ink)+
      geom_text(aes(label=sprintf("%+.1f",difference)),nudge_y=.25,size=5.8,colour=ink)+
      scale_y_discrete(limits=rev(paired$preparation))+
      scale_x_continuous(limits=c(-28,12),breaks=c(-20,-10,0,10))+
      labs(x="Change in activity: Q minus vehicle (U/mg protein)",y=NULL)+theme_d+
      theme(panel.grid.major.y=element_blank())
  }
  save(change_plot(paired),"bio-changes",10,4.5)
  strip <- function(dat, summaries=FALSE) {
    dat <- dat[order(dat$difference),];dat$height<-rep(c(.95,1.08),length.out=nrow(dat))
    p<-ggplot(dat,aes(difference,height))+
      geom_point(size=4.2,colour=ink)+
      geom_text(aes(label=preparation),nudge_y=.15,size=5.6,colour=muted)+
      geom_text(aes(label=sprintf("%+.1f",difference)),nudge_y=-.17,size=5.4,colour=ink)+
      scale_x_continuous(limits=c(-28,12),breaks=c(-20,-10,0,10))+
      scale_y_continuous(limits=c(.15,1.6),breaks=NULL)+
      labs(x="Change in activity: Q minus vehicle (U/mg protein)",y=NULL)+theme_d+
      theme(panel.grid.major=element_blank())
    if(summaries) {
      v<-describe_changes(dat$difference)
      p<-p+geom_segment(x=v$mean,xend=v$mean,y=.35,yend=1.43,colour=rust,linewidth=.8)+
        geom_segment(x=v$median,xend=v$median,y=.35,yend=1.43,colour=teal,linetype="dashed",linewidth=.8)+
        annotate("text",x=v$mean+1,y=.37,label=paste0("Mean ",sprintf("%.1f",v$mean)),hjust=0,colour=rust,size=6)+
        annotate("text",x=v$median-1,y=.22,label=paste0("Median ",sprintf("%.1f",v$median)),hjust=1,colour=teal,size=6)
    }
    p
  }
  save(strip(paired),"changes-sorted",11.5,3.3)
  save(strip(paired,TRUE),"changes-centres",11.5,3.3)
  both<-rbind(transform(paired,scenario="Original six comparisons"),transform(extreme,scenario="Hypothetical: only P5 is changed"))
  both$scenario<-factor(both$scenario,levels=c("Original six comparisons","Hypothetical: only P5 is changed"))
  both$height <- ifelse(both$preparation=="P1",.92,ifelse(both$preparation=="P4",1.08,1))
  stats<-do.call(rbind,lapply(split(both,both$scenario),function(z) data.frame(scenario=z$scenario[1],mean=mean(z$difference),median=median(z$difference))))
  ext<-ggplot(both,aes(difference,height))+
    geom_point(aes(colour=preparation=="P5",shape=preparation=="P5"),size=4.5)+
    scale_colour_manual(values=c(ink,rust))+scale_shape_manual(values=c(16,18))+
    geom_text(data=subset(both,preparation=="P5"),aes(label=sprintf("P5: %+.1f",difference)),nudge_y=.25,size=5.5,colour=rust)+
    facet_wrap(~scenario,ncol=1)+scale_x_continuous(limits=c(-30,80),breaks=seq(-20,80,20))+
    scale_y_continuous(limits=c(.25,1.6),breaks=NULL)+labs(x="Change in activity: Q minus vehicle (U/mg protein)",y=NULL)+
    theme_d+theme(panel.grid.major.y=element_blank())
  save(ext,"extreme-predict",11.5,4.1)
  ext2<-ext+
    geom_segment(data=stats,aes(x=mean,xend=mean,y=.45,yend=1.5),inherit.aes=FALSE,colour=rust,linewidth=.8)+
    geom_segment(data=stats,aes(x=median,xend=median,y=.45,yend=1.5),inherit.aes=FALSE,colour=teal,linetype="dashed",linewidth=.8)+
    geom_text(data=stats,aes(x=23,y=.75,label=paste0("Mean ",sprintf("%.1f",mean))),inherit.aes=FALSE,hjust=0,colour=rust,size=5.8)+
    geom_text(data=stats,aes(x=23,y=.37,label=paste0("Median ",sprintf("%.1f",median))),inherit.aes=FALSE,hjust=0,colour=teal,size=5.8)
  save(ext2,"extreme-reveal",11.5,4.1)
  v<-describe_changes(paired$difference)
  rng<-ggplot(paired,aes(difference,1))+
    geom_segment(x=v$minimum,xend=v$maximum,y=.45,yend=.45,colour=muted,linewidth=1.3)+
    geom_segment(x=v$q1,xend=v$q3,y=.7,yend=.7,colour=teal,linewidth=8)+
    geom_point(size=4,colour=ink)+
    geom_text(aes(label=preparation),nudge_y=.14,size=5.3,colour=muted)+
    annotate("text",x=(v$q1+v$q3)/2,y=.7,label="IQR",colour="white",size=5.5)+
    annotate("text",x=v$q1,y=.87,label=paste0("Q1 ",sprintf("%.1f",v$q1)),hjust=1,size=5.3,colour=teal)+
    annotate("text",x=v$q3,y=.87,label=paste0("Q3 ",sprintf("%.1f",v$q3)),hjust=0,size=5.3,colour=teal)+
    annotate("text",x=mean(c(v$minimum,v$maximum)),y=.28,label=paste0("Range: ",sprintf("%.1f",v$range)),size=5.5,colour=muted)+
    scale_x_continuous(limits=c(-30,12),breaks=c(-20,-10,0,10))+
    scale_y_continuous(limits=c(.1,1.3),breaks=NULL)+labs(x="Change in activity: Q minus vehicle (U/mg protein)",y=NULL)+
    theme_d+theme(panel.grid.major=element_blank())
  save(rng,"changes-spread",11.5,3.7)
  dev<-ggplot(paired,aes(difference,preparation))+
    geom_vline(xintercept=v$mean,colour=rust,linewidth=.9)+
    geom_segment(aes(x=v$mean,xend=difference,yend=preparation),colour=teal,linewidth=1.2)+
    geom_point(colour=ink,size=4)+scale_y_discrete(limits=rev(paired$preparation))+
    labs(x="Change in activity: Q minus vehicle (U/mg protein)",y=NULL)+theme_d+
    theme(panel.grid.major.y=element_blank())
  save(dev,"changes-deviations",8,4.1)
  toy$pattern<-factor(toy$pattern,levels=c("Spread across the scale","Five similar, one far away"))
  # Stack identical values honestly instead of overplotting them.
  toy$height<-ave(toy$value,toy$pattern,round(toy$value,7),FUN=seq_along)
  toyplot<-ggplot(toy,aes(value,height))+
    geom_point(size=4.2,colour=ink)+facet_wrap(~pattern,ncol=1)+
    scale_y_continuous(limits=c(.5,5.7),breaks=NULL)+
    scale_x_continuous(limits=c(-30,18),breaks=c(-20,-10,0,10))+
    labs(x="Change in activity (U/mg protein)",y=NULL)+theme_d+
    theme(panel.grid.major.y=element_blank())
  save(toyplot,"same-summaries",11.5,4.0)
  box<-ggplot(paired,aes(x="Six paired changes",y=difference))+
    geom_boxplot(width=.32,fill="#E3ECE7",colour=teal,outlier.shape=NA,linewidth=.9)+
    geom_point(aes(x=1+c(-.08,.08,-.04,.04,-.06,.06)),size=4,colour=ink)+
    coord_flip()+labs(x=NULL,y="Q minus vehicle (U/mg protein)")+theme_d+
    theme(panel.grid.major.y=element_blank(),axis.text.y=element_blank())
  save(box,"changes-boxpoints",9,3.1)
  save(p,"bio-pairs-compact",9,4.3)
  histdata<-rbind(transform(paired,binning="Bins 5 units wide"),transform(paired,binning="Bins 10 units wide"))
  histdata$binning<-factor(histdata$binning,levels=c("Bins 5 units wide","Bins 10 units wide"))
  hp<-ggplot(histdata,aes(difference))+
    geom_histogram(data=subset(histdata,binning=="Bins 5 units wide"),binwidth=5,boundary=0,fill="#BFD4D2",colour=paper)+
    geom_histogram(data=subset(histdata,binning=="Bins 10 units wide"),binwidth=10,boundary=0,fill="#BFD4D2",colour=paper)+
    geom_rug(sides="b",colour=ink,linewidth=.8)+facet_wrap(~binning,nrow=1)+
    scale_x_continuous(breaks=c(-20,0,10))+coord_cartesian(xlim=c(-30,15))+
    scale_y_continuous(breaks=0:3,limits=c(0,3.3))+
    labs(x="Q minus vehicle (U/mg protein)",y="Number of preparations")+theme_d+
    theme(panel.grid.major.x=element_blank())
  save(hp,"histogram-six",11.5,4.1)
}
