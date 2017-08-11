#' Get Good Turing discount from ngram frequency table
#'
#' @param df data.frame
#' @param freq name of freq column
#' @param mx max freq to consider for GT discount
#'
#' @examples
#'
#' bigram_tbl <- create_gram_table(text_sample, 2) %>%
#'   rename(bigram = ngram)
#'
#' bigrams_gt <- gt_discount(bigram_tbl, N)
#'
#' @export

gt_discount <- function(df, N, mx=5){

  N <- enquo(N)

  df_gt <- df %>%
    group_by(!!N) %>%
    summarise(Nr=n()) %>%
    filter(!!N <= mx+1) %>%
    arrange(!!N) %>%
    mutate(GT_discount=(((!!N)+1)/(!!N))*(lead(Nr,1)/Nr))

  # create lookup table
  gt_lu <- df_gt[["GT_discount"]][1:5]
  names(gt_lu) <- df_gt %>% pull(!!N) %>% .[1:5]

  return(gt_lu)
}


# freq_of_freq2 <- function(dt,freq=r){
#         dt <- dt[,list(Nr=.N),by=r]
#         dt <- dt[r<=6]
#         dt <- dt[order(r)]
#
#         return(dt)
# }
