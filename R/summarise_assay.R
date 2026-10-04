# Describe the existing dataset. No filtering, resimulation or inferential methods.
summarise_assay <- function(d) {
  stopifnot(nrow(d) == 36, all(table(d$vessel) == 3))
  vessels <- aggregate(activity ~ preparation + day + vessel + condition, d, mean)
  paired <- reshape(vessels[c("preparation", "day", "condition", "activity")],
                    idvar = c("preparation", "day"), timevar = "condition", direction = "wide")
  names(paired) <- sub("activity.Vehicle", "vehicle", names(paired), fixed = TRUE)
  names(paired) <- sub("activity.Compound Q", "compound", names(paired), fixed = TRUE)
  paired <- paired[order(paired$preparation), ]; rownames(paired) <- NULL
  paired$difference <- paired$compound - paired$vehicle
  list(vessels = vessels, paired = paired)
}
describe_changes <- function(x) {
  q <- quantile(x, c(.25,.75), type = 7, names = FALSE)
  data.frame(n = length(x), mean = mean(x), median = median(x), minimum = min(x),
             maximum = max(x), range = diff(range(x)), q1 = q[1], q3 = q[2],
             iqr = diff(q), variance = var(x), sd = sd(x))
}
