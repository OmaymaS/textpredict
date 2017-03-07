# read given documents
twitter<-readLines('../data-raw/text_source/en_US.twitter.txt' )
blogs<-readLines('../data-raw/text_source/en_US.blogs.txt')
news<-readLines('../data-raw/text_source/en_US.news.txt')

All_doc <- c(twitter,blogs,news)

remove(twitter)
remove(blogs)
remove(news)

set.seed(1205)

intrain <- sample(seq_along(All_doc),0.7*length(All_doc), replace = F)
trainx <- All_doc[intrain]

# write
writeLines(trainx,"../data-raw/dbs/train.txt")

remove(trainx)
remove(intrain)

corp70 <-  PCorpus(DirSource("../data-raw/dbs", encoding="UTF-8",mode="text"),
                  dbControl=list(dbName="corx_newx.db", dbType="DB1"))


# corp70 <-  PCorpus(VectorSource(kk1),
#                    dbControl=list(dbName="corx_newy.db", dbType="DB1"))

s <- Sys.time()
corp5 <- tm_map(corp70, content_transformer(clean_text),profanity=profanity)
Sys.time()-s

write(corp5[[1]][[1]],"../data-raw/train_clean.txt")

saveRDS(corp5[[1]][[1]],"../data-raw/train_clean.rds")


