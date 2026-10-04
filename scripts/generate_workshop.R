library(ggplot2)
set.seed(20261012)
dir.create('data/workshop',recursive=TRUE,showWarnings=FALSE)
conds<-list(c('Vehicle','Low','Medium'),c('Vehicle','High'),c('Vehicle','Low','Medium','High'))
rows<-list();k<-0
for(line in c('Line A','Line B'))for(day in 1:3){prep<-paste(line,day);base<-rnorm(5,100,12)+c(-8,7,0)[day];for(dose in conds[[day]]){level<-match(dose,c('Vehicle','Low','Medium','High'))-1;true<-base-c(5,2,1,3,0)*level+rnorm(5,0,4);for(protein in 1:5)for(well in 1:3){k<-k+1;rows[[k]]<-data.frame(line,day,prep,dose,protein=paste0('P',protein),well,value=rnorm(1,true[protein],3))}}}
x<-do.call(rbind,rows)
# Calibrated teaching illustration, not a claim of an unselected random outcome.
# Three technical readings in each group; equal sample SD 5; Welch df = 4.
delta<-qt(1-.032/2,df=4)*sqrt(2*25/3)
for(dose in c('Vehicle','High')){ix<-which(x$line=='Line B'&x$day==2&x$protein=='P1'&x$dose==dose);x$value[ix]<-100-ifelse(dose=='High',delta,0)+c(-5,0,5)}
x$excluded<-with(x,line=='Line A'&day==3&dose=='Low'&protein=='P3'&well==3)
x$value[x$excluded]<-190
x$dose<-factor(x$dose,levels=c('Vehicle','Low','Medium','High'))
write.csv(x,'data/workshop/technical_readings.csv',row.names=FALSE)
a<-aggregate(value~line+day+prep+dose+protein,x,mean);kept<-aggregate(value~line+day+prep+dose+protein,x[!x$excluded,],mean);a$excluded_in_vessel<-with(a,line=='Line A'&day==3&dose=='Low'&protein=='P3');write.csv(a,'data/workshop/vessel_means.csv',row.names=FALSE)
sel<-subset(x,line=='Line B'&day==2&protein=='P1');test<-t.test(value~dose,droplevels(sel));stopifnot(abs(test$p.value-.032)<1e-12)
write.csv(data.frame(comparison='Line B day 2 P1 high versus vehicle',p=test$p.value,Q_minus_vehicle=-delta,valid_biological_inference=FALSE),'data/workshop/reported_result.csv',row.names=FALSE)
ink<-'#172E3B';teal<-'#237A87';rust<-'#B64C2E';paper<-'#FAF8F2'
th<-theme_minimal(base_size=19)+theme(text=element_text(colour=ink),plot.background=element_rect(fill=paper,colour=NA),panel.grid.minor=element_blank())
savefig<-function(g,name,w=11,h=3.5)ggsave(paste0('figures/generated/workshop-',name,'.png'),g+th,width=w,height=h,dpi=160,bg=paper)
# Initial lab-meeting plot intentionally omits provenance; notes retain full metadata.
g<-ggplot(sel,aes(dose,value))+stat_summary(fun=mean,geom='col',width=.5,fill=teal,alpha=.65)+geom_point(size=3,position=position_jitter(width=.05,seed=4),colour=ink)+scale_x_discrete(labels=c('Vehicle','R'))+labs(x=NULL,y='Protein signal (a.u.)');savefig(g,'opening',7,3.2)
layout<-unique(x[c('line','day','dose')]);layout$day<-factor(layout$day,levels=1:3,labels=paste('Day',1:3));g<-ggplot(layout,aes(dose,day))+geom_tile(fill=teal,width=.88,height=.75)+geom_text(label='1 vessel',colour='white',size=5)+facet_wrap(~line)+scale_x_discrete(drop=FALSE)+labs(x=NULL,y=NULL);savefig(g,'days',11,3.2)
a$day<-factor(a$day,levels=1:3,labels=paste('Day',1:3));g<-ggplot(a,aes(dose,value,group=day,colour=day))+geom_line(linewidth=.5)+geom_point(size=2.4)+geom_point(data=subset(a,excluded_in_vessel),shape=1,size=5,colour=ink,stroke=1)+facet_grid(line~protein)+scale_x_discrete(labels=c('V','L','M','H'))+scale_colour_manual(values=c(teal,rust,'#7C718E'))+labs(x=NULL,y='Protein signal (a.u.)',colour=NULL)+theme(legend.position='top',axis.text.x=element_text(angle=35,hjust=1,size=12),strip.text=element_text(size=15));savefig(g,'full-data',12,5)
# Show the excluded technical reading and both summaries locally, without changing the full-data view.
e<-subset(x,line=='Line A'&day==3&dose=='Low'&protein=='P3');g<-ggplot(e,aes(factor(well),value))+geom_point(size=4,colour=teal)+geom_point(data=subset(e,excluded),shape=1,size=7,colour=ink)+labs(x='Assay well',y='P3 signal (a.u.)');savefig(g,'excluded',7,3)
allp<-list();j<-0
for(line in unique(x$line))for(day in 1:3)for(protein in unique(x$protein))for(dose in setdiff(conds[[day]],'Vehicle')){z<-x[x$line==line&x$day==day&x$protein==protein&x$dose%in%c('Vehicle',dose)&!x$excluded,];j<-j+1;allp[[j]]<-data.frame(line,day,protein,dose,p=t.test(value~droplevels(dose),z)$p.value)}
write.csv(do.call(rbind,allp),'data/workshop/researcher_screen.csv',row.names=FALSE)
stopifnot(nrow(x)==270,nrow(a)==90,sum(x$excluded)==1,j==60,all(table(interaction(x$line,x$day,x$dose,x$protein,drop=TRUE))==3))
cat('Reported technical-well Welch p:',test$p.value,'; change:',-delta,'\n')
