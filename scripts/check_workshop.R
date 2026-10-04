x<-read.csv('data/workshop/technical_readings.csv');a<-read.csv('data/workshop/vessel_means.csv');p<-read.csv('data/workshop/researcher_screen.csv')
stopifnot(nrow(x)==270,nrow(a)==90,nrow(p)==60,sum(x$excluded)==1)
s<-subset(x,line=='Line B'&day==2&protein=='P1');v<-s$value[s$dose=='Vehicle'];r<-s$value[s$dose=='High'];se<-sqrt(var(v)/3+var(r)/3);df<-(var(v)/3+var(r)/3)^2/((var(v)/3)^2/2+(var(r)/3)^2/2);direct<-2*pt(-abs((mean(r)-mean(v))/se),df)
stopifnot(abs(direct-.032)<1e-12,abs(t.test(r,v)$p.value-.032)<1e-12,abs(mean(v)-100)<1e-12)
agg<-aggregate(value~line+day+prep+dose+protein,x,mean);key<-function(d)with(d,paste(line,day,dose,protein));stopifnot(max(abs(agg$value-a$value[match(key(agg),key(a))]))<1e-10)
for(i in 1:nrow(p)){z<-x[x$line==p$line[i]&x$day==p$day[i]&x$protein==p$protein[i]&x$dose%in%c('Vehicle',p$dose[i])&!x$excluded,];stopifnot(abs(t.test(value~dose,z)$p.value-p$p[i])<1e-12)}
stopifnot(sum(a$excluded_in_vessel)==1,all(table(interaction(x$line,x$day,x$dose,x$protein,drop=TRUE))==3))
cat('Workshop checks passed: all means, 60 reported screen calculations, exact .032 construction, hierarchy and exclusion.\n')
