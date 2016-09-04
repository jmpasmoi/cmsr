#'Commission management system with R
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
  markup <- spp-csp

  if(markup < 0){stop("Markup shall be positive")}

  return((markup/csp)*100)

}

#'Commission management system with R
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

   markdown <- p-dp

   if(markdown < 0){stop("Markdown shall be positive")}

   return((markdown/p)*100)
}
