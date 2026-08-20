args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)
lab_dir <- if (length(file_arg)) dirname(normalizePath(sub("^--file=", "", file_arg[1]))) else normalizePath(getwd())
data_path <- function(name) file.path(lab_dir, "data", name)
out_path <- function(name) file.path(lab_dir, "outputs", name)
dir.create(out_path(""), recursive = TRUE, showWarnings = FALSE)
options(stringsAsFactors = FALSE)

h <- read.csv(data_path("health-research.csv"))
tres <- t.test(weight~smoker,h,var.equal=FALSE,alternative="two.sided")
g <- split(h$weight,h$smoker); pooled <- sqrt(((length(g[[1]])-1)*var(g[[1]])+(length(g[[2]])-1)*var(g[[2]]))/(length(g[[1]])+length(g[[2]])-2)); d <- (mean(g[[1]])-mean(g[[2]]))/pooled
fit <- aov(cancer_cell~chest_pain,h); an <- summary(fit)[[1]]; tuk <- TukeyHSD(fit)$chest_pain
tout <- data.frame(mean_group_1=unname(tres$estimate[1]),mean_group_2=unname(tres$estimate[2]),difference=diff(unname(tres$estimate)),p_value=tres$p.value,conf_low=tres$conf.int[1],conf_high=tres$conf.int[2])
write.csv(tout,out_path("lab-06-t-test.csv"),row.names=FALSE); write.csv(data.frame(cohens_d=d),out_path("lab-06-effect-size.csv"),row.names=FALSE); write.csv(data.frame(term=rownames(an),an,row.names=NULL),out_path("lab-06-anova.csv"),row.names=FALSE); write.csv(data.frame(comparison=rownames(tuk),tuk,row.names=NULL),out_path("lab-06-tukey.csv"),row.names=FALSE)
png(out_path("lab-06-group-comparison.png"),1100,650,res=130); par(mfrow=c(1,2)); boxplot(weight~smoker,h,col=c("#CADCFC","#10B981"),main="Weight by smoking status",ylab="Weight (kg)"); boxplot(cancer_cell~chest_pain,h,col="#F59E0B",las=2,main="Cancer-cell indicator by chest pain",ylab="Indicator"); dev.off()
cat("Lab 6 complete; t-test p", signif(tres$p.value,4), "effect", round(d,2), "\n")
