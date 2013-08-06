library(doMC)
registerDoMC()

seperateImages <- function(d) {
  im <- foreach(i = d$Image, .combine = rbind) %dopar% {
    as.integer(unlist(strsplit(i, " ")))
  }
  d$Image <- NULL
  return(im)
}

saveData <- function() {
 train.file <- paste0('training.csv')
 test.file <- paste0('test.csv')

 d.train <- read.csv(train.file, stringsAsFactors=F)
 im.train <- seperateImages(d.train)
 
 d.test <- read.csv(test.file, stringsAsFactors=F)
 im.test <- seperateImages(d.test)

 save(d.train, im.train, d.test, im.test, file='data.Rd')
}

 
 
 
