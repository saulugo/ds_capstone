library(quanteda)
setwd('coursera/data_science/capstone/')
text <- readLines(file('data/en_US/en_US.blogs.txt'))
index <- rbinom(text,1,0.1)
sample_text <- sample(text[index==1],replace= FALSE)
txt <- c(text1 = "This is $10 in 999 different ways,\n up and down; left and right!",
text2 = "@kenbenoit working: on #quanteda 2day\t4ever, http://textasdata.com?page=123.")
txt
txt[1]
txt[[1]]
tokenize(txt)
class(tokenize(txt))
tokenize(txt, removeNumbers = TRUE, removePunct = TRUE)
txt
tokenize(txt, removeNumbers = TRUE, removePunct = TRUE)
tokenize(txt)
tokenize(txt, removeNumbers = FALSE, removePunct = TRUE)
tokenize(txt, removeNumbers = TRUE, removePunct = FALSE)
tokenize(txt, removeNumbers = FALSE, removePunct = FALSE)
tokenize(txt, removeNumbers = FALSE, removePunct = FALSE, removeSeparators = FALSE)
tokenize(txt,what="character")
tokenize(txt,what="character",removeNumbers = TRUE,removePunct = TRUE, removeTwitter = TRUE,removeHyphens = TRUE)
system.time(dfm1 <- dfm(corpus))
corpus <- corpus(sample_text)
system.time(dfm1 <- dfm(corpus))
topfeatures(dfm1)
dfm1
?dfm
dfm2 <- dfm(corpus,removeTwitter = TRUE, removeNumbers = TRUE, removePunct = TRUE, removeSeparators = TRUE)
dfm2
dfm2[1:10,1:10]
texts(corpus)[1]
dfm2[1:10,1:100]
dfm2[1:10,1:11]
dfm2[1:10,1:12]
dfm2[1:10,5000:5010]
names(dfm2)
topfeatures(dfm2)
topfeatures(dfm2,decreasing=TRUE)
topfeatures(dfm2,decreasing==TRUE)
topfeatures(dfm2,decreasing=TRUE)
topfeatures(dfm2,decreasing=TRUE)
topfeatures(dfm2,decreasing=FALSE)
?docfreq
?dfm
dfm_2grands <- dfm(corpus,ngrams=2)
dfm_2grands
dfm_3grands <- dfm(corpus,ngrams=3)
dfm2_df <- as.data.frame(as.matrix(docfreq(dfm_2grands)))
head(dfm2_df)
tail(dfm2_df)
dfm2_df <- as.data.frame(as.matrix(dfm_2grands))
m2 <- as.matrix(dfm_2grands)
head(dfm_2grands)
head(dfm_df)
head(dfm2_df)
rownames(dfm2_df)
rownames(dfm2_df)[1:100]
grep('s*','saul')
grepl('s*','saul')
grepexp('s*','saul')
?grep
grepexpr('s*','saul')
gregexpr('s*','saul')
grepl('^I\'m',rownames(dfm2_df))
rownames(dfm2_df)[grepl('^I\'m',rownames(dfm2_df))]
rownames(dfm2_df)[grepl('lynda',rownames(dfm2_df))]
rownames(dfm2_df)[grepl('^lynda',rownames(dfm2_df))]
rownames(dfm2_df)[grepl('^I am',rownames(dfm2_df))]
rownames(dfm2_df)[grepl('^I_am',rownames(dfm2_df))]
rownames(dfm2_df)[grepl('^I',rownames(dfm2_df))]
rownames(dfm2_df)[grepl('^i'\',rownames(dfm2_df))]
rownames(dfm2_df)[grepl("^i\'m",rownames(dfm2_df))]
dfm2_df[grepl("^i\'m",rownames(dfm2_df))]
dfm2_df[grepl("^i\'m",rownames(dfm2_df)),]
dfm2_df[grepl("^lynda",rownames(dfm2_df)),]
dfm2_df$2grams <- rownames(dfm2_df)
dfm2_df$grams_2 <- rownames(dfm2_df)
head(dfm2_df)
dfm2_df[grepl("^lynda",rownames(dfm2_df)),]
?sort
x <- dfm2_df[grepl("^lynda",rownames(dfm2_df)),]
x
x <- dfm2_df[grepl("^i\'m",rownames(dfm2_df)),]
x
x <- dfm2_df[grepl("^i\'m_sure",rownames(dfm2_df)),]
x
x <- dfm2_df[grepl("^i\'m",rownames(dfm2_df)),]
x[with(x,order(-V1))]
x[with(x,order(-V1)),]
head(x[with(x,order(-V1)),])
