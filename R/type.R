#'Commission based on the Mark Up Percentage
#'
#' @param price selling price of product
#' @param product cost of product
#'
#' @details
#'
#' The Commission based on the mark up value. When the mark up value is calculated, a predefined table is used to retrieve the corresponding commission % based on the Product hierarchy and Mark Up % that will be used in the sales order. This commission percentage will be divided among the number of sales representatives involved in the order, if more than one.
#'
#' @author
#' Jean Marie Cimula
#'
#' @examples
#' Selling price $ 1.00, Cost of product $ 0.80.
#' cms_markup(1,0.8)
#'
#' @export
cms_markup <- function(price,product){

  spp <- price
  csp <- product

  return(ifelse(spp >= csp,(spp-csp)/csp,0))
}

#'Commission based on the Mark Down Percentage
#'
#' @param price List price
#' @param disc.price Discount price
#'
#' @author
#' Jean Marie Cimula
#'
#' @details
#' Mark Down represents the price that is below the net selling price with which the product is sold to the customer. For each mark down value calculated, a % percentage will be retrieved from a predefined table with the
#' combination of above percentage and product hierarchy up to 4th level. It means that the mark down % in this
#' case will be the corresponding % value of 5 in the mark down table.
#'
#' @examples
#' List price = $2.00, Discount price = $1.90
#' cms_markdown(2,1.9)
#'
#' @export
cms_markdown <- function(price,disc.price){

   p <- price
   dp <- disc.price

   return(ifelse(p >= dp,(p-dp)/p,0))
}

#'Sales Commission Rates on bonus
#'
#' @param total_prod total of products a sale rep shall sell
#' @param target threshold to reach by the sales reps
#' @param sales achievement in term of products sold
#' @param cost mean of price and discount price
#'
#' @author
#' Jean Marie Cimula
#'
#' @details
#' Calculation of the bonus based on the performance of the sales reps. It depends to your commercial policies
#'
#' @export
#'

cms_kpi_rate <- function(total_prod,target,sales,cost){

 return(ifelse(sales >= target, cost * (sales/total_prod), 0))

}
