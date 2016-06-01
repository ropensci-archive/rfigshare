# Helper function to get authentication
#
# The authentication environment is created by new.env function in the zzz.R file.  The authentication token 'oauth' is created by the figshare_auth function.  This helper function lets all other functions load the authentication.
# @keywords internal
 # fs_get_auth <- function(){
 #   if(!exists("oauth", envir=FigshareAuthCache))
 #     tryCatch(fs_auth(), error= function(e)
 #       stop("Requires authentication.
 #       Are your credentials stored in options?
 #       See fs_auth function for details."))
 #   get("oauth", envir=FigshareAuthCache)
 # }
#
#
#

fs_get_auth <- function(x = NULL) {
  if (is.null(x)) {
    x <- Sys.getenv("RFIGSHARE_PAT")
    if (nchar(x) == 0) {
      stop("no Figshare PAT found - go to https://figshare.com/account/applications to get a token", call. = FALSE)
    }
  }
  httr::add_headers(Authorization = paste0("token ", x))
}
