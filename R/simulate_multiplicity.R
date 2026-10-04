# Independent paired-difference outcomes. Each outcome has six observations and a valid two-sided t p-value.
# Standardized outcome units: mean effects are in paired-change SD units.
simulate_marker_family <- function(B=10000L,effects=rep(0,20),n=6L,seed=20261009L) {
 set.seed(seed);p<-means<-ses<-matrix(NA_real_,B,length(effects))
 for(j in seq_along(effects)) {
  x<-matrix(rnorm(B*n,effects[j],1),B,n);mu<-rowMeans(x);s<-sqrt(rowSums((x-mu)^2)/(n-1))
  ses[,j]<-s/sqrt(n);means[,j]<-mu
  p[,j]<-2*pt(-abs(mu/(s/sqrt(n))),n-1)
 }
 colnames(p)<-sprintf('M%02d',seq_along(effects));attr(p,'means')<-means;attr(p,'ses')<-ses;p
}
family_performance <- function(p,true_null,method='BH',level=.05) {
 adjusted<-t(apply(p,1,p.adjust,method=method));calls<-adjusted<level
 R<-rowSums(calls);V<-rowSums(calls[,true_null,drop=FALSE])
 data.frame(experiment=seq_len(nrow(p)),discoveries=R,false_discoveries=V,fdp=V/pmax(R,1),any_false=V>0)
}
