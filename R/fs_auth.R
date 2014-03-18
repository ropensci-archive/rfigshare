
#' Figshare authentication via OAuth1.0 using httr
#'
#' Figshare authentication via OAuth1.0 using httr
#' @return OAuth credential (invisibly).  The credential is also written to the enivornment "FigshareAuthCache", which is created when the package is loaded.  All functions needing authentication can then access the credential without it being explicitly passed in the function call.  
#' @import httr
#' @export
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @references \url{http://api.figshare.com}
#' @examples \dontrun{
#' fs_auth()
#' }

# cKey = getOption("FigshareKey"); cSecret = getOption("FigsharePrivateKey")
fs_auth <- 
function(){

  endpoint <- 
    oauth_endpoint("request_token", 
                   "authorize", 
                   "access_token", 
                   base_url = "http://api.figshare.com/v1/pbl/oauth")
  myapp <- oauth_app("rfigshare", 
                     key = "Kazwg91wCdBB9ggypFVVJg", 
                     secret = "izgO06p1ymfgZTsdsZQbcA")
  oauth <- oauth1.0_token(endpoint, myapp)

#  oauth <- sign_oauth1.0(myapp, token = token, token_secret = token_secret)
  assign('oauth', oauth, envir=FigshareAuthCache)

  # Test that we have authenticated
  if(GET("http://api.figshare.com/v1/my_data/articles", 
         config(token = oauth)
         )$status_code != 200){
    stop("Authentication failed, please check your credentials")
  } else {
    message("Authentication successful")
  }
  invisible(oauth)
} 


