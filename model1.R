#Loading the data
#setwd('coursera/data_science/capstone/')
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
sampleSize <- 0.01
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
dfm_5grands <- dfm(mycorpus,ngrams=5)
dfm_4grands <- dfm(mycorpus,ngrams=4)
dfm_3grands <- dfm(mycorpus,ngrams=3)
dfm_2grands <- dfm(mycorpus,ngrams=2)
dfm_1grands <- dfm(mycorpus,ngrams=1)

#Building ngrams dataframes
library(dplyr)
dfm5_df <- as.data.frame(as.matrix(docfreq(dfm_5grands)))
dfm4_df <- as.data.frame(as.matrix(docfreq(dfm_4grands)))
dfm3_df <- as.data.frame(as.matrix(docfreq(dfm_3grands)))
dfm2_df <- as.data.frame(as.matrix(docfreq(dfm_2grands)))
dfm1_df <- as.data.frame(as.matrix(docfreq(dfm_1grands)))
dfm5_df <- rename(dfm5_df,count = V1)
dfm5_df$ngram <- rownames(dfm5_df)
dfm4_df <- rename(dfm4_df,count = V1)
dfm4_df$ngram <- rownames(dfm4_df)
dfm3_df <- rename(dfm3_df,count = V1)
dfm3_df$ngram <- rownames(dfm3_df)
dfm2_df <- rename(dfm2_df,count = V1)
dfm2_df$ngram <- rownames(dfm2_df)
dfm1_df <- rename(dfm1_df,count = V1)
dfm1_df$ngram <- rownames(dfm1_df)

#Ordering the ngrams by frecuency
dfm5_df <- dfm5_df[with(dfm5_df,order(-count)),]
dfm4_df <- dfm4_df[with(dfm4_df,order(-count)),]
dfm3_df <- dfm3_df[with(dfm3_df,order(-count)),]
dfm2_df <- dfm2_df[with(dfm2_df,order(-count)),]
dfm1_df <- dfm1_df[with(dfm1_df,order(-count)),]

#saving the df to files
saveRDS(dfm5_df,file="dfm5_1perc.Rda")
saveRDS(dfm4_df,file="dfm4_1perc.Rda")
saveRDS(dfm3_df,file="dfm3_1perc.Rda")
saveRDS(dfm2_df,file="dfm2_1perc.Rda")
saveRDS(dfm1_df,file="dfm1_1perc.Rda")

