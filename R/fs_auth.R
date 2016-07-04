#' Figshare authentication
#'
#' @export
#' @param token (character) A Figshare personal access token. Required. See Details.
#' @details Instructions:
#' \itemize{
#'  \item Log in
#'  \item Go to "Applications" from the drop down menu in top right
#'  \item Scroll to bottom, find "Personal Tokens" section
#'  \item Click on "Create Personal Token"
#' }
#' @return sets your token as an env variable for the current R session, returns nothing
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @references \url{http://api.figshare.com}
#' @examples \dontrun{
#' fs_auth("aasdfasfasdfasdfasfasfds")
#' }
fs_auth <- function(token, force = FALSE) {
  if (Sys.getenv("RFIGSHARE_PAT", "") != "") {
    if (!force) {
      stop("your RFIGSHARE_PAT env var is already set, and `force = FALSE`", call. = FALSE)
    }
  }
  Sys.setenv(RFIGSHARE_PAT = token)
  message("success")
}



# fs_auth <-
#   function(cKey = getOption("FigshareKey", NULL),
#            cSecret = getOption("FigsharePrivateKey", NULL),
#            token = getOption("FigshareToken", NULL),
#            token_secret = getOption("FigsharePrivateToken", NULL)){
#
#   if(is.null(cKey))
#     cKey <- "Kazwg91wCdBB9ggypFVVJg"
#   if(is.null(cSecret))
#     cSecret <- "izgO06p1ymfgZTsdsZQbcA"
#
#   endpoint <-
#     oauth_endpoint("request_token",
#                    "authorize",
#                    "access_token",
#                    base_url = "http://api.figshare.com/v1/pbl/oauth")
#   myapp <- oauth_app("rfigshare",
#                      key = cKey,
#                      secret = cSecret)
#
#   if(is.null(token) && is.null(token_secret)) {
#     oauth <- oauth1.0_token(endpoint, myapp)
#   } else {
#     resp <- sign_oauth1.0(myapp, token = token, token_secret = token_secret)
#     oauth <- resp$token
#   }
#
#   assign('oauth', oauth, envir=FigshareAuthCache)
#
#   # Test that we have authenticated
#   response <- GET("http://api.figshare.com/v1/my_data/articles",
#          config(token = oauth)
#          )
#
#   if(response$status_code != 200){
#     warning(paste("Authentication failed, please check your credentials. Got code",
#                   response$status_code, "with response", content(response)))
#     oauth <- response
#   } else {
#     message("Authentication successful")
#   }
#   invisible(oauth)
# }


