#' Get Good Turing discount from ngram frequency table
#'
#' @param df data.frame
#' @param freq name of freq column
#' @param mx max freq to consider for GT discount
#'
#' @export

gt_discount <- function(df, N, mx=5){

  freq <- enquo(N)

  df %>%
    group_by(!!N) %>%
    summarise(Nr=n()) %>%
    filter(!!N <= mx+1) %>%
    arrange(!!N) %>%
    mutate(GT_discount=(((!!N)+1)/(!!N))*(lead(Nr,1)/Nr)) %>%
    head(., mx)
}


# freq_of_freq2 <- function(dt,freq=r){
#         dt <- dt[,list(Nr=.N),by=r]
#         dt <- dt[r<=6]
#         dt <- dt[order(r)]
#
#         return(dt)
# }
