# Prospective calculations for a specified normal, independent paired-difference model.
# n counts independent preparation pairs. Include both rejection tails explicitly.
paired_power <- function(n, effect, difference_sd, alpha=.05) {
  critical <- qt(1-alpha/2,n-1)
  ncp <- abs(effect)*sqrt(n)/difference_sd
  pt(-critical,n-1,ncp=ncp)+pt(critical,n-1,ncp=ncp,lower.tail=FALSE)
}
required_pairs <- function(effect,difference_sd,target=.8,alpha=.05) {
  n <- 2:5000
  n[which(paired_power(n,effect,difference_sd,alpha)>=target)[1]]
}
simulate_unrelated_means <- function(B=10000L,seed=20261008L) {
  set.seed(seed);n <- 6L
  # Twelve unrelated preparations, six per condition, both conditions balanced across days.
  day <- matrix(rep(c(-9,-9,4,4,11,11),each=B),B,n)
  v <- 100+day+matrix(rnorm(B*n,0,15),B,n)+matrix(rnorm(B*n,0,3),B,n)
  q <- 100+day+matrix(rnorm(B*n,0,15),B,n)+matrix(rnorm(B*n,-14,9),B,n)+matrix(rnorm(B*n,0,3),B,n)
  vv <- qq <- matrix(0,B,n)
  for(j in 1:3) {vv<-vv+round(v+matrix(rnorm(B*n,0,2.5),B,n),2)/3;qq<-qq+round(q+matrix(rnorm(B*n,0,2.5),B,n),2)/3}
  rowMeans(qq)-rowMeans(vv)
}
