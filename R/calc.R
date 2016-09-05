#' The Calculation of Commission of sales reps
#'
#' @param df data.frame
#' @param com.type type of the commission ( Markdown or Markup)
#' @param rmv.na boolean value of na (TRUE or FALSE)
#'
#' @export
#'
#' @details
#'
#' @author
#' Jean Marie Cimula
#'
#' @importFrom magrittr %>%
#'

cmscalc <- function (df, ..., com.type = c("Markdown","Markup"), rmv.na = TRUE){


  if(is.atomic(rmv.na)){ df <- na.omit(df)}

  tp <- com.type

  if(length(tp) > 1){ warning("Please entry only one commission type either Markdown or Markup") }
  else{ tp <- tolower(tp) }

  df <- df %>% dplyr::group_by(sales_rep_id, region) %>%
        dplyr::summarise(total_prod = sum(total_prod), target = sum(target), price = mean(price), mean_discount=mean(discountprice), sales=sum(sales), mean_cost=mean(cost)) %>%
        dplyr::mutate(total_price = price * sales, total_cost = sales * mean_cost, total_disc = sales * mean_discount)

  if(tp == "markup"){

    dfa <- dplyr::mutate(df, markup = cms_markup(total_price, total_cost))

  }else if(tp == "markdown"){

    dfa <- dplyr::mutate(df, markdown = cms_markdown(total_price, total_disc))

  }else{ dfa <- "Please entry only one commission type either Markdown or Markup" }

  return(dfa)
}
