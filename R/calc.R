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

#' Activation tracking of sales forces
#'
#' @param df data.frame
#' @param region filter the region of activities. Default "ALL"
#' @param from the beginning of the period eg."2016-06-01"
#' @param to the end of the period eg."2016-06-30"
#' @param set.target xxxxxxxxx
#' @export
#'
#' @details
#'
#' @author
#' Jean Marie Cimula
#'
#' @importFrom magrittr %>%
#'
cms_tracker <- function(   dataframe,
                                ...,
                                region="ALL",
                                from=FALSE,
                                to=FALSE,
                                set.target=c("50","50","50","50","50","50")
                        ){

  df <- cmstelecom

  ###if to void then (from = to and sum)
  ###if to and from void then (sum all)
  ###if region missing then (print all) else (get value and filter)
  ###set.target depends to the commercial policies in order to judge the achievement of salesforce

  #Not finished
  #:P

  df <- df %>%
        dplyr::filter(as.Date(date, "%m/%d/%Y") >= from && as.Date(date, "%m/%d/%Y") <= to ) %>%
        dplyr::group_by(agent_id, activation) %>% dplyr::summarise(nb =sum(nb_subs))

  tidyr::spread(df,activation,nb)

}
