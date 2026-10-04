# Offline simulation of the existing assay mechanism, vectorized over experiments.
# Allocation labels are omitted: exchanging iid vessel errors leaves the contrast law unchanged.
simulate_repeated_assay <- function(B=10000L, n=6L, seed=20261003L, biological_sd=9, true_mean=-14) {
  stopifnot(n %% 2L == 0L)
  set.seed(seed)
  day <- rep(seq_len(n/2), each=2)
  day_shift <- rep(c(-9,4,11), length.out=n/2)
  baseline <- matrix(100 + day_shift[day], B, n, byrow=TRUE) + matrix(rnorm(B*n,0,15),B,n)
  effect <- matrix(rnorm(B*n,true_mean,biological_sd),B,n)
  vehicle <- baseline + matrix(rnorm(B*n,0,3),B,n)
  compound <- baseline + effect + matrix(rnorm(B*n,0,3),B,n)
  v <- q <- matrix(0,B,n)
  for (j in 1:3) {
    v <- v + round(vehicle + matrix(rnorm(B*n,0,2.5),B,n),2)/3
    q <- q + round(compound + matrix(rnorm(B*n,0,2.5),B,n),2)/3
  }
  q-v
}
interval_summary <- function(x) {
  n <- ncol(x); m <- rowMeans(x)
  s <- sqrt(rowSums((x-m)^2)/(n-1)); se <- s/sqrt(n)
  half <- qt(.975,n-1)*se
  data.frame(experiment=seq_len(nrow(x)),n=n,mean=m,sd=s,se=se,
             lower=m-half,upper=m+half,covered=m-half<=-14 & m+half>=-14)
}
