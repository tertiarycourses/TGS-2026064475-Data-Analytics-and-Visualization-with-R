args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)
lab_dir <- if (length(file_arg)) dirname(normalizePath(sub("^--file=", "", file_arg[1]))) else normalizePath(getwd())
data_path <- function(name) file.path(lab_dir, "data", name)
out_path <- function(name) file.path(lab_dir, "outputs", name)
dir.create(out_path(""), recursive = TRUE, showWarnings = FALSE)
options(stringsAsFactors = FALSE)

f <- read.csv(data_path("feedback.csv"),fileEncoding="UTF-8-BOM")
stop <- scan(data_path("stopwords.txt"),what="",quiet=TRUE)
all_words <- unlist(strsplit(tolower(gsub("[^[:alpha:] ]"," ",paste(f$comment,collapse=" "))),"\\s+")); all_words<-all_words[nchar(all_words)>1]
rank_terms <- function(extra=character()){z<-sort(table(all_words[!all_words %in% c(stop,extra)]),decreasing=TRUE); data.frame(word=names(z),count=as.integer(z))}
r1<-rank_terms(); r2<-rank_terms(c("health","patient","patients")); write.csv(r1,out_path("lab-08-ranked-terms.csv"),row.names=FALSE)
sens<-merge(head(r1,30),head(r2,30),by="word",all=TRUE,suffixes=c("_base","_domain_stop")); write.csv(sens,out_path("lab-08-sensitivity.csv"),row.names=FALSE)
set.seed(4475); png(out_path("lab-08-word-cloud.png"),1200,750,res=130,bg="white")
top<-head(r1,50)
if(requireNamespace("wordcloud",quietly=TRUE)){wordcloud::wordcloud(top$word,top$count,max.words=50,random.order=FALSE,colors=c("#1F6FEB","#10B981","#7C3AED","#F59E0B"))} else {plot.new(); plot.window(c(0,1),c(0,1)); sizes<-0.8+2.5*(top$count-min(top$count))/(max(top$count)-min(top$count)+1); text(runif(nrow(top),.08,.92),runif(nrow(top),.08,.92),top$word,cex=sizes,col=rep(c("#1F6FEB","#10B981","#7C3AED","#F59E0B"),length.out=nrow(top)))}
dev.off(); cat("Lab 8 complete; top term", r1$word[1], "\n")
