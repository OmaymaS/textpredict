#' create_gram_table: Create n-gram tables with frequency
#'
#' @export
#'
create_gram_table <- function(x, input_col, n){

        g <- tidytext::unnest_tokens(x, ngram, input_col,
                                     token = "ngrams", n = n)%>%
                group_by(ngram) %>%
                summarise(N=n()) %>%
                arrange(desc(N))

        return(g)
}


#' create_gram_table2: Create n-gram tables with frequency - data.table implementation
#'



# create_gram_table2 <- function(x,n){
#
#         g <- unnest_tokens(data.frame(txt=x),
#                            ngram, txt,
#                            token = "ngrams", n = n)
#         g <- data.table(g)
#         g <- g[,list(r=.N),by=ngram]
#         g <- g[order(r,decreasing = T)]
#
#         return(g)
# }
