args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)
lab_dir <- if (length(file_arg)) dirname(normalizePath(sub("^--file=", "", file_arg[1]))) else normalizePath(getwd())
data_path <- function(name) file.path(lab_dir, "data", name)
out_path <- function(name) file.path(lab_dir, "outputs", name)
dir.create(out_path(""), recursive = TRUE, showWarnings = FALSE)
options(stringsAsFactors = FALSE)

d <- read.csv(data_path("dengue.csv"), na.strings = c("", "NA"), check.names = FALSE)
input_rows <- nrow(d)
missing_rows <- sum(!complete.cases(d[c("year", "eweek", "type_dengue", "number")]))
clean_dengue <- d[complete.cases(d[c("year", "eweek", "type_dengue", "number")]) & d$type_dengue == "Dengue", ]
clean_dengue$date <- as.Date(sprintf("%d-01-01", clean_dengue$year)) + (clean_dengue$eweek - 1) * 7
clean_dengue <- clean_dengue[order(clean_dengue$date), c("year", "eweek", "type_dengue", "number", "date")]
write.csv(clean_dengue, out_path("lab-01-clean-dengue.csv"), row.names = FALSE)
log <- data.frame(stage=c("Input", "Missing required values", "Complete Dengue output"), rows=c(input_rows, missing_rows, nrow(clean_dengue)))
write.csv(log, out_path("lab-01-transformation-log.csv"), row.names = FALSE)
png(out_path("lab-01-dengue-trend.png"), 1200, 700, res=130)
plot(clean_dengue$date, clean_dengue$number, type="l", lwd=2, col="#1F6FEB", xlab="Week", ylab="Reported cases", main="Weekly dengue cases")
grid(col="#E2E8F0"); dev.off()
stopifnot(nrow(clean_dengue) + missing_rows <= input_rows, all(!is.na(clean_dengue$date)))
cat("Lab 1 complete:", nrow(clean_dengue), "clean rows\n")
