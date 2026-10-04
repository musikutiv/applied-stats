source('R/simulate_intervals.R')
source('R/summarise_assay.R')
source('R/plot_uncertainty.R')
out <- 'data/uncertainty'; dir.create(out,showWarnings=FALSE,recursive=TRUE)
x <- simulate_repeated_assay()
s <- interval_summary(x)
write.csv(data.frame(experiment=rep(1:nrow(x),each=6),preparation=rep(1:6,nrow(x)),change=as.vector(t(x))),file.path(out,'repeated_changes.csv'),row.names=FALSE)
write.csv(s,file.path(out,'repeated_intervals.csv'),row.names=FALSE)
observed <- summarise_assay(read.csv('data/simulated/assay_readings.csv'))$paired
obs <- interval_summary(matrix(observed$difference,nrow=1)); obs$covered <- NULL
write.csv(obs,file.path(out,'observed_interval.csv'),row.names=FALSE)
# Independent comparison scenarios, same true mean -14; all other noise sources unchanged.
more_var <- interval_summary(simulate_repeated_assay(seed=20261004L,biological_sd=18))
more_n <- interval_summary(simulate_repeated_assay(n=24L,seed=20261005L))
scenarios <- rbind(transform(s,scenario='Original: n = 6'),transform(more_var,scenario='More biological variation: n = 6'),transform(more_n,scenario='More preparations: n = 24'))
write.csv(scenarios,file.path(out,'precision_scenarios.csv'),row.names=FALSE)
metrics <- data.frame(true_mean=-14,repetitions=nrow(x),coverage=mean(s$covered),
                     response_sd=sd(as.vector(x)),mean_sd=sd(s$mean),
                     theoretical_response_sd=sqrt(9^2+2*3^2+2*2.5^2/3),
                     more_variation_se=sd(more_var$mean),more_n_se=sd(more_n$mean))
write.csv(metrics,file.path(out,'simulation_metrics.csv'),row.names=FALSE)
plot_uncertainty(observed,obs,x,s,scenarios,metrics)
print(obs);print(metrics)
