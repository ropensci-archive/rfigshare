#' Figshare authentication
#'
#' @export
#' @param token (character) A Figshare personal access token. Required.
#' See Details.
#' @param force (logical) force resetting env var
#' @details Instructions:
#' \itemize{
#'  \item Log in
#'  \item Go to "Applications" from the drop down menu in top right
#'  \item Scroll to bottom, find "Personal Tokens" section
#'  \item Click on "Create Personal Token"
#' }
#' @return sets your token as an env variable for the current R session,
#' returns nothing
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @references http://api.figshare.com
#' @examples \dontrun{
#' fs_auth("aasdfasfasdfasdfasfasfds")
#' }
fs_auth <- function(token, force = FALSE) {
  if (Sys.getenv("RFIGSHARE_PAT", "") != "") {
    if (!force) {
      stop("your RFIGSHARE_PAT env var is already set, and `force = FALSE`",
           call. = FALSE)
    }
  }
  Sys.setenv(RFIGSHARE_PAT = token)
  message("success")
}
