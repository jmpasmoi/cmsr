#' Activation tracking of sales forces in telecom industry
#'
#' A dataset containing the sales forces activities. The variables are as follows:
#'
#' @format A data frame with 140 rows and 6 variables:
#' \itemize{
#'   \item sales_rep_id: the id of each salesforce
#'   \item region: geographical region of acitivies
#'   \item activation: activation items
#'   \item wording
#'
#'          1. Preactivation: sim enabled but it has not generated revenue
#'
#'          2. New with Revenue: sim enabled and has generated revenue on the day of activation
#'
#'          3. Adjustment: sim enabled but having generated revenue a few days after the activation date
#'
#'          4. Gross connection: New with Revenue + Adjustment
#'
#'          5. Disconnection: sim with 60 days of inactivity
#'
#'          6. Reconnection: a Disconnection having resumed activity
#'
#'          7. New Neet (or Net Add): Gross connection + Reconnection - Disconnection
#'
#'   \item nb_subs: number of subscribers
#'   \item date: date of activity
#' }
"cmstelecom"
