source('R/simulate_intervals.R');source('R/power_design.R');source('R/plot_power.R')
x <- simulate_repeated_assay(seed=20261007L)
s <- interval_summary(x);s$p <- 2*pt(-abs(s$mean/s$se),5);s$reject <- s$p<.05
write.csv(data.frame(experiment=rep(1:nrow(x),each=6),preparation=rep(1:6,nrow(x)),change=as.vector(t(x))),'data/power/repeated_changes.csv',row.names=FALSE)
write.csv(s,'data/power/repeated_experiments.csv',row.names=FALSE)
# Pedagogical contrast: first rejection and first non-rejection, selected by outcome and labelled.
ids <- c(which(s$reject)[1],which(!s$reject)[1]);examples <- s[ids,]
write.csv(examples,'data/power/illustrative_experiments.csv',row.names=FALSE)
sigma <- sqrt(9^2+2*3^2+2*2.5^2/3)
curves <- rbind(
 data.frame(factor='Effect magnitude (U/mg)',value=seq(0,22,by=.5),power=paired_power(6,seq(0,22,by=.5),sigma)),
 data.frame(factor='Biological response SD (U/mg)',value=seq(3,22,by=.5),power=paired_power(6,14,sqrt(seq(3,22,by=.5)^2+2*3^2+2*2.5^2/3))),
 data.frame(factor='Independent preparation pairs',value=3:24,power=paired_power(3:24,14,sigma)),
 data.frame(factor='Decision threshold α',value=seq(.005,.1,by=.001),power=paired_power(6,14,sigma,seq(.005,.1,by=.001))))
write.csv(curves,'data/power/factor_curves.csv',row.names=FALSE)
precision <- data.frame(n=c(3,6,12,24));precision$se <- sigma/sqrt(precision$n)
write.csv(precision,'data/power/precision.csv',row.names=FALSE)
unrelated <- simulate_unrelated_means()
design <- rbind(data.frame(design='Unrelated preparations',mean=unrelated),data.frame(design='Matched preparation pairs',mean=s$mean))
write.csv(design,'data/power/design_comparison.csv',row.names=FALSE)
wells <- data.frame(option=c('Current: 36 wells','Add 6 technical wells','Add 1 new preparation pair'),se=c(sigma/sqrt(6),sqrt((3*(9^2+18+2*2.5^2/4)+3*sigma^2)/36),sigma/sqrt(7)))
write.csv(wells,'data/power/assay_well_options.csv',row.names=FALSE)
grid <- expand.grid(effect=c(6,10,14),difference_sd=c(8,12,16));grid$n <- mapply(required_pairs,grid$effect,grid$difference_sd);grid$target <- .8;grid$alpha <- .05
write.csv(grid,'data/power/planning_sensitivity.csv',row.names=FALSE)
metrics <- data.frame(seed=20261007,repetitions=nrow(x),true_effect=-14,difference_sd=sigma,power=mean(s$reject),beta=mean(!s$reject),analytic_power=paired_power(6,14,sigma),unrelated_se=sd(unrelated),paired_se=sd(s$mean),illustration_reject_id=ids[1],illustration_nonreject_id=ids[2])
write.csv(metrics,'data/power/metrics.csv',row.names=FALSE)
plot_power(x,s,examples,curves,precision,design,wells,grid,metrics)
print(metrics);print(examples);print(grid)
