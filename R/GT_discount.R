#' Get Good Turing discount from ngram frequency table
#'
#' @param df data.frame
#' @param freq name of freq column
#' @param mx max freq to consider for GT discount
#'
#' @export

gt_discount <- function(df,freq=r,mx=5){
        df %>%
                group_by(r) %>%
                summarise(Nr=n()) %>%
                filter(r<=mx+1) %>%
                arrange(r) %>%
                mutate(GT_discount=((r+1)/r)*(lead(Nr,1)/Nr)) %>%
                head(.,mx)

}


# freq_of_freq2 <- function(dt,freq=r){
#         dt <- dt[,list(Nr=.N),by=r]
#         dt <- dt[r<=6]
#         dt <- dt[order(r)]
#
#         return(dt)
# }
