# Preparation only; reuse the original simulated readings byte-for-byte.
source("R/summarise_assay.R")
source("R/plot_descriptive.R")
d<-read.csv("data/simulated/assay_readings.csv")
s<-summarise_assay(d)
dir.create("data/derived",showWarnings=FALSE)
write.csv(s$vessels,"data/derived/vessel_summaries.csv",row.names=FALSE)
write.csv(s$paired,"data/derived/paired_changes.csv",row.names=FALSE)
# Clearly labelled hypothetical variant: raise every Q aliquot for P5 by 60.
hypothetical<-d
selected<-hypothetical$preparation=="P5" & hypothetical$condition=="Compound Q"
hypothetical$activity[selected]<-hypothetical$activity[selected]+60
extreme<-summarise_assay(hypothetical)$paired
write.csv(hypothetical,"data/derived/hypothetical_extreme_readings.csv",row.names=FALSE)
write.csv(extreme,"data/derived/hypothetical_extreme_changes.csv",row.names=FALSE)
summary<-rbind(cbind(scenario="original",describe_changes(s$paired$difference)),
               cbind(scenario="hypothetical_P5_plus60",describe_changes(extreme$difference)))
write.csv(summary,"data/derived/descriptive_summaries.csv",row.names=FALSE)
# Constructed demonstration, not additional experimental observations.
# Both tiny datasets are scaled to the original six changes' exact mean and sample SD.
z1<-c(-3,-2,-1,1,2,3); z2<-c(-1,-1,-1,-1,-1,5)
scale_to_original<-function(z) as.numeric(scale(z))*sd(s$paired$difference)+mean(s$paired$difference)
toy<-data.frame(pattern=rep(c("Spread across the scale","Five similar, one far away"),each=6),
                value=c(scale_to_original(z1),scale_to_original(z2)))
write.csv(toy,"data/derived/constructed_same_summaries.csv",row.names=FALSE)
plot_descriptive(s$paired,extreme,toy)
print(summary,digits=5,row.names=FALSE)
cat("Paired changes:\n");print(s$paired,digits=5,row.names=FALSE)
