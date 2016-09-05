#' Data simulation of sales reps activities
#'
#' A dataset containing the sales reps activities. The variables are as follows:
#'
#' @format A data frame with 60 rows and 10 variables:
#' \itemize{
#'   \item sales_rep_id: the id of each sale rep
#'   \item region: geographical region of acitivies
#'   \item product: product available on the market in charge of sales reps
#'   \item total_prod: total of products a sale rep shall sell
#'   \item target: the threshold of number of products to sell "75% of total"
#'   \item date: date of activity
#'   \item price: price of a particular product
#'   \item discountprice: discount price "7% of the price)"
#'   \item sales: number of product sold by day
#'   \item cost: the mean of price and discountprice
#' }
"cmsales"
