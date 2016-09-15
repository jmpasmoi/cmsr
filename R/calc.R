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
#' @param set.target depends to the commercial policies in order to judge the achievement of salesforce
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

  f <- formals(cms_tracker)

  namesize <- names(f)

  reg <- do.call(missing, list(namesize[3]))

  from  <- do.call(missing, list(namesize[4]))

  to  <- do.call(missing, list(namesize[5]))

  set <- do.call(missing, list(namesize[6]))

  ###set.target depends to the commercial policies in order to judge the achievement of salesforce

  df <- as.data.frame(dataframe)

  if(reg==FALSE){

    r <- tolower(region)

    df <- subset(df, df$region %in% r)

  }else{df <- df}

  nb_row <- nrow(df)

  if(nb_row < 1){stop("No records found with your entries")}

  if(from==TRUE && to==TRUE){ from <- 0; to <- 0}

  if(from==TRUE && to==FALSE){ from <- to}

  if(from==FALSE && to==TRUE){ to <- from}

  if(from==FALSE && to==FALSE){ from <- from; to <- to}


  if(from == 0 && to == 0){

    df <- df %>% dplyr::group_by(agent_id,activation) %>% dplyr::summarise(nb =sum(nb_subs))

  }else{

    df <- df[cmsdate(as.Date(df$date,"%m/%d/%Y"), from, to),]

    df <- df %>% dplyr::group_by(agent_id,activation) %>% dplyr::summarise(nb =sum(nb_subs))
  }

  print(from)
  print(to)
 #tidyr::spread(df,activation,nb)

}
