#' Create n-gram tables with frequency - data.table implementation

create_gram_table <- function(x,n){

        g <- unnest_tokens(data.frame(txt=x),
                           ngram, txt,
                           token = "ngrams", n = n)
        g <- data.table(g)
        print(class(g))
        g <- g[,.N,by=ngram]

        g <- g[order(N,decreasing = T)]

        return(g)
}
