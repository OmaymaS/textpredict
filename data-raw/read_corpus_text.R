# read given documents
twitter<-readLines('../data-raw/text_source/en_US.twitter.txt' )
blogs<-readLines('../data-raw/text_source/en_US.blogs.txt')
news<-readLines('../data-raw/text_source/en_US.news.txt')

All_doc <- c(twitter,blogs,news)

remove(twitter)
remove(blogs)
remove(news)

set.seed(1205)

intrain <- sample(seq_along(All_doc),0.001*length(All_doc), replace = F)
trainx <- All_doc[intrain]

# write
writeLines(trainx,"../data-raw/text_sample/train_sample.txt")

remove(trainx)
remove(intrain)

# corp70 <-  PCorpus(DirSource("../data-raw/dbs", encoding="UTF-8",mode="text"),
#                   dbControl=list(dbName="sample_text_70.db", dbType="DB1"))


corp_sample<-  PCorpus(DirSource("../data-raw/text_sample", encoding="UTF-8",mode="text"),
                   dbControl=list(dbName="sample_text.db", dbType="DB1"))


text_sample <- corp_sample[[1]][[1]]

devtools::use_data(text_sample)

# write(corp5[[1]][[1]],"../data-raw/train_clean.txt")
#
# saveRDS(corp5[[1]][[1]],"../data-raw/train_clean.rds")


