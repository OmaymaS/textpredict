create_gram_table <- function(x,n){

        # df <- data.table(txt=x)

        g <- unnest_tokens(data.table(txt=x),
                           ngram, txt,
                           token = "ngrams", n = n)
        g <- data.table(g)
        g <- g[,.N,by=ngram]
        g <- g[order(N,decreasing = T)]

        return(g)
}
