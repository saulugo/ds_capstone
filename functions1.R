predict_word <- function(words){
  words <- tolower(unlist(strsplit(words," ")))
  n <- length(words)
  res <- NA
  
  if(n==1){ #I must read the 2-gram DF
    re <- paste0("^",words,"_")
    res <- dfm2_df[grepl(re,rownames(dfm2_df)),]$ngram[1]
  }
  
  if(n==2) { #I must read the 3-gram DF
    gram <- paste0(words,collapse="_")
    re <- paste0("^",gram,"_")
    res <- dfm3_df[grepl(re,rownames(dfm3_df)),]$ngram[1]  
    if(is.na(res)){ #check the last word, n = 1
      words <- words[2]
      re <- paste0("^",words,"_")
      res <- dfm2_df[grepl(re,rownames(dfm2_df)),]$ngram[1]
    }
  }
  
  if(n==3) { #I must read the 4-gram DF
    gram <- paste0(words,collapse="_")
    re <- paste0("^",gram,"_")
    res <- dfm4_df[grepl(re,rownames(dfm4_df)),]$ngram[1]  
    if(is.na(res)){ #check the last 2 words, n = 2
      words <- words[2:3]
      gram <- paste0(words,collapse="_")
      re <- paste0("^",gram,"_")
      res <- dfm3_df[grepl(re,rownames(dfm3_df)),]$ngram[1]
      if(is.na(res)){ #check the last word, n = 1
        words <- words[2]
        re <- paste0("^",words,"_")
        res <- dfm2_df[grepl(re,rownames(dfm2_df)),]$ngram[1]
      }
    }
  }
  
  if(n>3) { #I must read the 5-gram DF
    if(n>4) words <- words[(n-3):n]
    gram <- paste0(words,collapse="_")
    re <- paste0("^",gram,"_")
    res <- dfm5_df[grepl(re,rownames(dfm5_df)),]$ngram[1] 
    if(is.na(res)){ #check the last 3 words, n = 3
      words <- words[2:4]
      gram <- paste0(words,collapse="_")
      re <- paste0("^",gram,"_")
      res <- dfm4_df[grepl(re,rownames(dfm4_df)),]$ngram[1]
      if(is.na(res)){ #check the last 2 words, n = 2
        words <- words[2:3]
        gram <- paste0(words,collapse="_")
        re <- paste0("^",gram,"_")
        res <- dfm3_df[grepl(re,rownames(dfm3_df)),]$ngram[1]
        if(is.na(res)){ #check the last word, n = 1
          words <- words[2]
          re <- paste0("^",words,"_")
          res <- dfm2_df[grepl(re,rownames(dfm2_df)),]$ngram[1]
        }
      }
    }
  }
  
 
  res
}