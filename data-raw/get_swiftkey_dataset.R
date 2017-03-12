sk_url <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"

if(!file.exists("data-raw/swiftkey_dataset/swiftkey.zip"))
{
        download.file(sk_url, destfile="./swiftkey_dataset/swiftkey.zip")
}

if(!file.exists("./swiftkey_dataset/swiftkey_unzipped"))
{
        dir.create("./swiftkey_dataset/swiftkey_unzipped")
}


if(length(list.files("./swiftkey_dataset/swiftkey_unzipped"))==0)
{
        unzip("swiftkey.zip",exdir="./swiftkey_dataset/swiftkey_unzipped")
}

