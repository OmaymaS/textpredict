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
create_gram_table <- function(input_txt, n, freq_col){
  freq_col <- enquo(freq_col)
  freq_col_name <- quo_name(freq_col)

  x <- data_frame(txt = input_txt)

  g <- tidytext::unnest_tokens(x, ngram, txt,
                               token = "ngrams", n = n) %>%
    group_by(ngram) %>%
    summarise( !!freq_col_name := n()) %>%
    arrange(desc( !!freq_col))

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
