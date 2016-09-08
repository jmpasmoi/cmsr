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

  df <- df %>% dplyr::group_by(sales_rep_id, region, product) %>%
               dplyr::mutate(
                      bonus = cms_kpi_rate(total_prod,target,sales,cost),
                      total_price = price * total_prod,
                      total_cost = sales * cost,
                      total_disc = sales * discountprice
                  )%>%
               dplyr::summarise(
                      total_prod = sum(total_prod),
                      target = sum(target),
                      sales=sum(sales),
                      total_price=sum(total_price),
                      total_disc=sum(total_disc),
                      total_sales=sum(total_cost), #or total_cost
                      bonus=sum(bonus)
                )

  if(tp == "markup"){

    dfa <- dplyr::mutate(df, markup = cms_markup(total_price, total_sales) )

  }else if(tp == "markdown"){

    dfa <- dplyr::mutate(df, markdown = cms_markdown(total_price, total_disc))

  }else{ stop("Please entry only one commission type either Markdown or Markup") }

  return(as.data.frame(dfa))
}
