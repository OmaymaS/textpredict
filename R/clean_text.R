#' Clean raw text
#'
#' @export
clean_text <- function(x, profanity=""){
        y <- x %>%
                stri_trans_general(.,id="latin-ascii") %>%
                gsub("\\&","and",.) %>%
                gsub("[^[:alpha:][:space:]\']", " ",.) %>%
                gsub("\'{1,}","'",.) %>%
                gsub("'(?!\\w)|(?<!\\w)'", " ", ., perl = TRUE) %>%
                tolower() %>%
                removeWords(.,profanity) %>%
                gsub("\\br(t)\\b|\\blo{1,}l\\b|\\bz{2,}\\b", " ", .) %>%
                gsub("http[[:alnum:]]*|www[[:alnum:]]*", " ", .) %>%
                # gsub("\\b[b-hj-z]\\b", " ", .) %>%
                gsub("(?<!\\w|\')[b-hj-z](?!\\w|\')", " ",.,perl=T) %>%
                stripWhitespace() %>%
                trimws()

        return(y)
}

