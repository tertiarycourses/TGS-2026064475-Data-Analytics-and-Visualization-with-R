args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)
lab_dir <- if (length(file_arg)) dirname(normalizePath(sub("^--file=", "", file_arg[1]))) else normalizePath(getwd())
data_path <- function(name) file.path(lab_dir, "data", name)
out_path <- function(name) file.path(lab_dir, "outputs", name)
dir.create(out_path(""), recursive = TRUE, showWarnings = FALSE)
options(stringsAsFactors = FALSE)

f <- read.csv(data_path("feedback.csv"),fileEncoding="UTF-8-BOM")
stop <- scan(data_path("stopwords.txt"),what="",quiet=TRUE)
token_rows <- lapply(seq_len(nrow(f)),function(i){x<-tolower(gsub("[^[:alpha:] ]"," ",f$comment[i])); w<-unlist(strsplit(x,"\\s+")); w<-w[nchar(w)>1]; data.frame(record_id=f$record_id[i],channel=f$channel[i],word=w)})
tokens <- do.call(rbind,token_rows); kept <- tokens[!tokens$word %in% stop,]
freq <- sort(table(kept$word),decreasing=TRUE); freq_df <- data.frame(word=names(freq),count=as.integer(freq))
channel <- as.data.frame(table(channel=kept$channel,word=kept$word)); channel <- channel[channel$Freq>0,]
write.csv(tokens,out_path("lab-07-tokens.csv"),row.names=FALSE); write.csv(data.frame(stopword=stop),out_path("lab-07-stopword-audit.csv"),row.names=FALSE); write.csv(freq_df,out_path("lab-07-term-frequency.csv"),row.names=FALSE); write.csv(channel,out_path("lab-07-channel-frequency.csv"),row.names=FALSE)
stopifnot(sum(freq_df$count)==nrow(kept))
cat("Lab 7 complete; retained tokens", nrow(kept), "\n")
