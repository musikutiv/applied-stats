source("R/summarise_assay.R")
source("R/simulate_assay.R")
d<-read.csv("data/simulated/assay_readings.csv")
stopifnot(isTRUE(all.equal(d,simulate_assay(),check.attributes=FALSE)))
p<-read.csv("data/derived/paired_changes.csv")
s<-summarise_assay(d)
stopifnot(nrow(p)==6, isTRUE(all.equal(p,s$paired,check.attributes=FALSE)),
          sum(p$difference<0)==4, abs(p$difference[p$preparation=="P2"])<.01)
e<-read.csv("data/derived/hypothetical_extreme_changes.csv")
stopifnot(all(abs((e$difference-p$difference)-ifelse(p$preparation=="P5",60,0))<1e-10),
          abs(mean(e$difference)-mean(p$difference)-10)<1e-10,
          identical(median(e$difference),median(p$difference)))
stats<-read.csv("data/derived/descriptive_summaries.csv")
stopifnot(isTRUE(all.equal(unname(unlist(stats[1,-1])),unname(unlist(describe_changes(p$difference))),tolerance=1e-10)))
toy<-read.csv("data/derived/constructed_same_summaries.csv")
for(z in split(toy$value,toy$pattern)) {
 stopifnot(length(z)==6,abs(mean(z)-mean(p$difference))<1e-10,
           abs(sd(z)-sd(p$difference))<1e-10)
}
# Match plotted box quartiles to the declared R type-7 summaries.
library(ggplot2)
box<-ggplot_build(ggplot(p,aes(x="all",y=difference))+geom_boxplot())$data[[1]]
stopifnot(abs(box$lower-stats$q1[1])<1e-10,abs(box$upper-stats$q3[1])<1e-10,
          abs(box$middle-stats$median[1])<1e-10,
          abs(stats$variance[1]-sum((p$difference-mean(p$difference))^2)/5)<1e-10)
for(width in c(5,10)) {
 h<-ggplot_build(ggplot(p,aes(difference))+geom_histogram(binwidth=width,boundary=0))$data[[1]]
 stopifnot(sum(h$count)==6)
}
cat("Verified original-data preservation, six paired changes, hypothetical-only perturbation, summaries, equal-mean/SD illustration, box quartiles and histogram counts.\n")
