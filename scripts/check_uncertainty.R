source('R/summarise_assay.R');source('R/simulate_intervals.R');source('R/simulate_assay.R')
raw <- read.csv('data/simulated/assay_readings.csv')
stopifnot(isTRUE(all.equal(raw,simulate_assay(),check.attributes=FALSE)))
p <- summarise_assay(raw)$paired$difference
obs <- read.csv('data/uncertainty/observed_interval.csv')
manual <- mean(p)+c(-1,1)*qt(.975,5)*sd(p)/sqrt(6)
stopifnot(abs(obs$mean-mean(p))<1e-10,abs(obs$se-sd(p)/sqrt(6))<1e-10,
          max(abs(c(obs$lower,obs$upper)-manual))<1e-10)
r <- read.csv('data/uncertainty/repeated_changes.csv')
s <- read.csv('data/uncertainty/repeated_intervals.csv')
x <- matrix(r$change,ncol=6,byrow=TRUE)
stopifnot(nrow(x)==10000,all(table(r$experiment)==6),max(abs(x-simulate_repeated_assay()))<1e-10)
fresh <- interval_summary(x)
stopifnot(isTRUE(all.equal(s,fresh,tolerance=1e-10,check.attributes=FALSE)))
# Broad Monte Carlo tolerance verifies mechanism rather than forcing desired coverage.
truth_sd <- sqrt(9^2+2*3^2+2*2.5^2/3)
stopifnot(abs(mean(s$mean)+14)<.15,abs(sd(s$mean)-truth_sd/sqrt(6))<.15,
          abs(mean(s$covered)-.95)<.015)
cases <- read.csv('data/uncertainty/precision_scenarios.csv')
bycase <- split(cases,cases$scenario)
stopifnot(sd(bycase[['More biological variation: n = 6']]$mean)>sd(s$mean),
          sd(bycase[['More preparations: n = 24']]$mean)<sd(s$mean),
          all(sapply(bycase,function(d) abs(mean(d$mean)+14)<.2)))
cat('PASS: original data unchanged; paired interval and SE verified; fixed seed reproducible; six changes per experiment; every interval recomputed; mean, SE and coverage agree with model; precision scenarios retain the true mean.\n')
