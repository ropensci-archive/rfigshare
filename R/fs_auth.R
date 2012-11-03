
#' Figshare authentication via httr
#'
#' User specific API methods require obtaining access keys from Figshare.com. To do so, first sign up at the Figshare \href{http://api.figshare.com/docs}{developer site} and obtain Figshare API keys. Ideally you should store these keys in your \code{.rprofile} like so:
#'
#' \code{options(FigsharePrivateKey="Your_Key")}
#' \code{options(FigsharePrivateToken="Your_secret_key")}
#' \code{options(FigshareSecret="Your_secret_key")}
#' \code{options(FigshareToken="Your_secret_key")}
#'
#' If this is not possible (assuming you are on a public machine), then you can specify both inline. Calling \code{fs_auth()} with the right keys will launch your default browser and take you to Figshare.com to authorize this application. If you are not logged in, you will first be prompted to login with your Figshare user/pass. Next, click accept to see a pin. At that point, copy the pin and paste it back at the R prompt. If you assign this to a R object, then you can use that as the first argument in all functions that require authentication.
#' If you have successfully completed this step, you should ideally save the \code{Oauth credential object} to disk for future use. There is no need to repeat this step each time.
#' @param cKey Consumer key. can be supplied here or read from Options()
#' @param  cSecret Consumer secret. can be supplied here or read from Options()
#' @param token the Figshare token. can be supplied here or read from Options()
#' @param token_secret the Figshare secret token. can be supplied here or read from Options()
#' API key creditentials can be set in .Rprofile using options("FigshareKey" = "XXXXXX-XXXX")
#' @return OAuth credential (invisibly).  The credential is also written to the enivornment "FigshareAuthCache", which is created when the package is loaded.  All functions needing authentication can then access the credential without it being explicitly passed in the function call.  
#' @import httr 
#' @export
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @references \url{http://api.figshare.com}
#' @examples \dontrun{
#' fs_auth()
#' }

fs_auth <- 
function(cKey = getOption("FigshareKey", stop("Missing Figshare consumer key")),
       cSecret = getOption("FigsharePrivateKey", stop("Missing Figshare app secret")),
       token = getOption("FigshareToken", stop("Missing Figshare token")),
       token_secret = getOption("FigsharePrivateToken", stop("Missing Figshare Secret Token"))){
  myapp <- oauth_app("rfigshare", key = cKey, secret=cSecret)
  oauth <-  httr:::sign_oauth1.0(myapp, token = token, token_secret = token_secret)
  assign('oauth', oauth, envir=FigshareAuthCache)
  invisible(oauth)
} 



