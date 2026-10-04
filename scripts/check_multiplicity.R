source('R/simulate_multiplicity.R')
p<-as.matrix(read.csv('data/multiplicity/all_null_p.csv')[,-1]);fresh<-simulate_marker_family()
stopifnot(dim(p)==c(10000,20),max(abs(p-fresh))<1e-12,abs(mean(p<.05)-.05)<.003,
 abs(mean(rowSums(p<.05)>0)-(1-.95^20))<.015,abs(mean(rowSums(p<.05))-1)<.04)
# Validate first generated paired test against the library implementation.
set.seed(20261009L);x<-matrix(rnorm(10000*6),10000,6);stopifnot(abs(t.test(x[1,])$p.value-p[1,1])<1e-12)
e<-read.csv('data/multiplicity/adjusted_example.csv');j<-match(e$marker,colnames(p));i<-e$experiment
stopifnot(i==which(rowSums(p<.05)>0)[1],j==which(p[i,]<.05)[1],abs(e$p-p[i,j])<1e-12,abs(e$bonferroni-min(1,20*e$p))<1e-12,abs(e$lower-(e$mean-qt(.975,5)*e$se))<1e-12)
h<-read.csv('data/multiplicity/holm_example.csv');manual_holm<-pmin(1,cummax(h$p*(6-h$rank)))
stopifnot(max(abs(h$holm-manual_holm))<1e-12,sum(h$bonferroni<.05)==1,sum(h$holm<.05)==3)
b<-read.csv('data/multiplicity/bh_example.csv');manual_bh<-pmin(1,rev(cummin(rev(b$p*8/b$rank))))
stopifnot(max(abs(b$adjusted-manual_bh))<1e-12,max(which(b$p<=b$threshold))==4,all(which(b$adjusted<.05)==1:4))
mixed<-as.matrix(read.csv('data/multiplicity/mixed_p.csv')[,-1]);stopifnot(max(abs(mixed-simulate_marker_family(effects=c(rep(1.5,4),rep(0,16)),seed=20261010L)))<1e-12)
perf<-read.csv('data/multiplicity/mixed_performance.csv')
for(method in c('none','holm','BH')) {
 d<-perf[perf$method==method,];v<-family_performance(mixed,5:20,method)
 stopifnot(max(abs(d$fdp-v$fdp))<1e-12,all(d$any_false==v$any_false),all(d$fdp[d$discoveries==0]==0))
}
stopifnot(mean(perf$fdp[perf$method=='BH'])<.055,mean(perf$any_false[perf$method=='holm'])<.055)
sel<-read.csv('data/multiplicity/selection_illustration.csv');stopifnot(max(abs(sel$minimum-apply(p[,1:5],1,min)))<1e-12,abs(mean(sel$minimum<.05)-(1-.95^5))<.015)
cat('PASS: fixed-seed valid paired p-values; per-test/FWER/count checks; complete-family adjustment; independent Holm/BH calculations; mixed-truth FDP with zero-list convention; selection distribution.\n')
