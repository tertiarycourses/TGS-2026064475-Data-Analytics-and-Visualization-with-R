args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)
lab_dir <- if (length(file_arg)) dirname(normalizePath(sub("^--file=", "", file_arg[1]))) else normalizePath(getwd())
data_path <- function(name) file.path(lab_dir, "data", name)
out_path <- function(name) file.path(lab_dir, "outputs", name)
dir.create(out_path(""), recursive = TRUE, showWarnings = FALSE)
options(stringsAsFactors = FALSE)

h <- read.csv(data_path("health-research.csv"))
x <- h$weight[is.finite(h$weight)]
stats <- data.frame(metric=c("n","mean","trimmed_mean_10","trimmed_mean_20","median","sd","variance","min","q1","q3","max","iqr"), value=c(length(x),mean(x),mean(x,trim=.1),mean(x,trim=.2),median(x),sd(x),var(x),min(x),quantile(x,.25),quantile(x,.75),max(x),IQR(x)))
lo <- quantile(x,.25)-1.5*IQR(x); hi <- quantile(x,.75)+1.5*IQR(x)
outliers <- h[h$weight<lo | h$weight>hi, ]
write.csv(stats,out_path("lab-03-summary.csv"),row.names=FALSE); write.csv(outliers,out_path("lab-03-outliers.csv"),row.names=FALSE)
png(out_path("lab-03-distribution.png"),1200,600,res=130); par(mfrow=c(1,2)); hist(x,col="#CADCFC",border="white",main="Weight distribution",xlab="Weight (kg)"); boxplot(x,horizontal=TRUE,col="#10B981",main="Weight and possible outliers",xlab="Weight (kg)"); dev.off()
stopifnot(stats$value[stats$metric=="n"]==nrow(h))
cat("Lab 3 complete; mean", round(mean(x),2), "median", median(x), "\n")
