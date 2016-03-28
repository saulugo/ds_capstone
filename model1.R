#Loading the data
setwd('coursera/data_science/capstone/')
library(quanteda)
con <- file('data/en_US/en_US.blogs.txt')
lines_blogs <- readLines(con)
close(con)
#con <- file('data/en_US/en_US.news.txt','r')
#lines_news <- readLines(con)
conNews = file("data/en_US/en_US.news.txt", open="rb")
lines_news <- readLines(conNews, skipNul=T)
close(conNews)
con <- file('data/en_US/en_US.twitter.txt','r')
lines_twitter <- readLines(con)
close(con)

#Sampling the data
sampleSize <- 0.05
set.seed(1234)
sample_blogs <- sample(lines_blogs,length(lines_blogs)*sampleSize,replace=FALSE)
sample_news <- sample(lines_news,length(lines_news)*sampleSize,replace=FALSE)
sample_twitter <- sample(lines_twitter,length(lines_twitter)*sampleSize,replace=FALSE)

#Building the corpus
corpus_blogs <- corpus(sample_blogs)
corpus_news <- corpus(sample_news)
corpus_twitter <- corpus(sample_twitter)
mycorpus <- corpus_blogs + corpus_news + corpus_twitter

#Building the dfm for ngrams
dfm_3grands <- dfm(mycorpus,ngrams=3)
dfm_2grands <- dfm(mycorpus,ngrams=2)
dfm_1grands <- dfm(mycorpus,ngrams=1)

#Building ngrams dataframes
library(dplyr)
dfm3_df <- as.data.frame(as.matrix(docfreq(dfm_3grands)))
dfm2_df <- as.data.frame(as.matrix(docfreq(dfm_2grands)))
dfm1_df <- as.data.frame(as.matrix(docfreq(dfm_1grands)))
dfm3_df <- rename(dfm3_df,count = V1)
dfm3_df$ngram <- rownames(dfm3_df)
dfm2_df <- rename(dfm2_df,count = V1)
dfm2_df$ngram <- rownames(dfm2_df)
dfm1_df <- rename(dfm1_df,count = V1)
dfm1_df$ngram <- rownames(dfm1_df)

#Ordering the ngrams by frecuency
dfm3_df <- dfm3_df[with(dfm3_df,order(-count)),]
dfm2_df <- dfm2_df[with(dfm2_df,order(-count)),]
dfm1_df <- dfm1_df[with(dfm1_df,order(-count)),]

predict_word <- function(words){
  n <- length(words)
  res <- "not_found"
  
  if(n==1){ #I must read the 2-gram DF
    re <- paste0("^",words,"_")
    res <- dfm2_df[grepl(re,rownames(dfm2_df)),]$ngram[1]
  }
  
  if(n==2) { #I must read the 3-gram DF
    gram <- paste0(words,collapse="_")
    re <- paste0("^",gram,"_")
    res <- dfm3_df[grepl(re,rownames(dfm3_df)),]$ngram[1]  
  }
    
  res
}




