source('R/simulate_multiplicity.R');source('R/plot_multiplicity.R')
p<-simulate_marker_family();write.csv(data.frame(experiment=1:nrow(p),p),'data/multiplicity/all_null_p.csv',row.names=FALSE)
i<-which(rowSums(p<.05)>0)[1];j<-which(p[i,]<.05)[1]
example<-data.frame(experiment=i,marker=colnames(p)[j],mean=attr(p,'means')[i,j],se=attr(p,'ses')[i,j],p=p[i,j],bonferroni=p.adjust(p[i,],'bonferroni')[j])
example$lower<-example$mean-qt(.975,5)*example$se;example$upper<-example$mean+qt(.975,5)*example$se
write.csv(example,'data/multiplicity/adjusted_example.csv',row.names=FALSE)
# Constructed ordered examples teach the algorithms, not observed L1 results.
holm<-data.frame(rank=1:5,p=c(.006,.011,.016,.030,.20));holm$bonferroni<-p.adjust(holm$p,'bonferroni');holm$holm<-p.adjust(holm$p,'holm');holm$step_threshold<-.05/(6-holm$rank)
write.csv(holm,'data/multiplicity/holm_example.csv',row.names=FALSE)
bh<-data.frame(rank=1:8,p=c(.002,.009,.018,.024,.055,.15,.4,.8));bh$threshold<-.05*bh$rank/8;bh$adjusted<-p.adjust(bh$p,'BH')
write.csv(bh,'data/multiplicity/bh_example.csv',row.names=FALSE)
mixed<-simulate_marker_family(effects=c(rep(1.5,4),rep(0,16)),seed=20261010L)
write.csv(data.frame(experiment=1:nrow(mixed),mixed),'data/multiplicity/mixed_p.csv',row.names=FALSE)
perf<-do.call(rbind,lapply(c('none','holm','BH'),function(method) transform(family_performance(mixed,5:20,method),method=method)))
write.csv(perf,'data/multiplicity/mixed_performance.csv',row.names=FALSE)
# Selection illustration from valid marginal p-values, independent alternatives solely for teaching.
selection<-data.frame(single=p[,1],minimum=apply(p[,1:5],1,min))
write.csv(selection,'data/multiplicity/selection_illustration.csv',row.names=FALSE)
metrics<-data.frame(all_null_fwer=mean(rowSums(p<.05)>0),theoretical_fwer=1-.95^20,expected_false_count=mean(rowSums(p<.05)),per_test_rate=mean(p<.05),min_of_five_rate=mean(selection$minimum<.05),mixed_bh_fdr=mean(perf$fdp[perf$method=='BH']),mixed_bh_fwer=mean(perf$any_false[perf$method=='BH']),mixed_holm_fwer=mean(perf$any_false[perf$method=='holm']))
write.csv(metrics,'data/multiplicity/metrics.csv',row.names=FALSE)
plot_multiplicity(p,holm,bh,perf,selection,metrics)
print(metrics);print(holm);print(bh)
