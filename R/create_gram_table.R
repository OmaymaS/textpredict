#' create_gram_table: Create n-gram tables with frequency
#'
#' @param input_text character vector
#' @param n ngram size
#'
#' @examples
#'
#' bigrams <- create_gram_table(text_sample, 2)
#'
#' @export
#'
create_gram_table <- function(input_txt, n){

  x <- data_frame(txt = input_txt)

  g <- tidytext::unnest_tokens(x, ngram, txt,
                               token = "ngrams", n = n) %>%
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
