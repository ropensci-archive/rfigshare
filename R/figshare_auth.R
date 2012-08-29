
#' Figshare authentication via httr
#'
#' User specific API methods require obtaining access keys from Figshare.com. To do so, first sign up at the Figshare \href{http://apidocs.mendeley.com/}{developer site} and obtain Figshare API keys. Ideally you should store these keys in your \code{.rprofile} like so:
#' \code{options(FigshareKey="Your_Key")}
#' \code{options(FigshareSecret="Your_secret_key")}
#' If this is not possible (assuming you are on a public machine), then you can spefify both inline. Calling \code{mendeley_auth()} with the right keys will launch your default browser and take you to Figshare.com to authorize this application. If you are not logged in, you will first be prompted to login with your Figshare user/pass. Next, click accept to see a pin. At that point, copy the pin and paste it back at the R prompt. If you assign this to a R object, then you can use that as the first argument in all functions that require authentication.
#' If you have successfully completed this step, you should ideally save the \code{Oauth credential object} to disk for future use. There is no need to repeat this step each time.
#' @param cKey Consumer key. can be supplied here or read from Options()
#' @param  cSecret Consumer secret. can be supplied here or read from Options()
#' API key creditentials can be set in .Rprofile using options("FigshareKey" = "XXXXXX-XXXX")
#' @return OAuth credential 
#' @import httr 
#' @export
#' @examples \dontrun{
#' sig <- figshare_auth()
#' GET('http://api.figshare.com/v1/my_data/authors?search_for=John Silva', sig)
#' }

figshare_auth <- 
function(cKey = getOption("FigshareKey", stop("Missing Figshare consumer key")),
       cSecret = getOption("FigsharePrivateKey", stop("Missing Figshare app secret")),
       token = getOption("FigshareToken", stop("Missing Figshare token")),
       token_secret = getOption("FigsharePrivateToken", stop("Missing Figshare Secret Token"))){
  require(httr)
  myapp <- oauth_app("rfigshare", key = cKey, secret=cSecret)
  sig <-  httr:::sign_ouath1.0(myapp, token = token, token_secret = token_secret) 
} 




################### DEPRICATED AND EXPERIMENTAL METHODS ############################

register_figshare_app <- function(cKey = getOption("FigshareKey", stop("Missing Figshare consumer key")),
       cSecret = getOption("FigsharePrivateKey", stop("Missing Figshare app secret"))){
  ## These commands are instead of creating the app manually on the web interface.  
  ## This is kind of pointless since you have to register manually online to get the consumer Key and secret key,
  ## and figshare will give you the token and secret token at that time.  
  reqURL <-  "http://api.figshare.com/v1/pbl/oauth/request_token"
  accessURL <- "http://api.figshare.com/v1/pbl/oauth/access_token"
  authURL <- "https://api.figshare.com/v1/pbl/oauth/authorize" 
  figshare <- oauth_endpoint(reqURL, authURL, accessURL)
  myapp <- oauth_app("cboettig_figshare", key = cKey, cSecret)
  token <- oauth1.0_token(figshare, myapp) 
# how do you get the secret token this way?? 
  httr:::sign_ouath1.0(myapp, token = token, token_secret = secret_token)
}




## Uses ROAuth directly, a more powerful way to do this, but the necessary version is not available on CRAN

#'Function to obtain OAuth tokens from Figshare to faciliate user specific methods.
#'
#' User specific API methods require obtaining access keys from Figshare.com. To do so, first sign up at the Figshare \href{http://apidocs.mendeley.com/}{developer site} and obtain Figshare API keys. Ideally you should store these keys in your \code{.rprofile} like so:
#' \code{options(FigshareKey="Your_Key")}
#' \code{options(FigshareSecret="Your_secret_key")}
#' If this is not possible (assuming you are on a public machine), then you can spefify both inline. Calling \code{mendeley_auth()} with the right keys will launch your default browser and take you to Figshare.com to authorize this application. If you are not logged in, you will first be prompted to login with your Figshare user/pass. Next, click accept to see a pin. At that point, copy the pin and paste it back at the R prompt. If you assign this to a R object, then you can use that as the first argument in all functions that require authentication.
#' If you have successfully completed this step, you should ideally save the \code{Oauth credential object} to disk for future use. There is no need to repeat this step each time.
#'@param cKey Consumer key. can be supplied here or read from Options()
#'@param  cSecret Consumer secret. can be supplied here or read from Options()
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#'@param ... optional additional curl options (debugging tools mostly).
#'@keywords authentication
#'@return OAUth credential.
#'@examples \dontrun{
#' cred <- figshare_auth('YOUR_CONSUMER_KEY', 'YOUR_CONSUMER_SECRET')
#' cred <- figshare_auth() # If your keys are stored in options using
#' as FigshareKey and FigsharePrivateKey.
#' registerFigshareOAuth(cred)
#'}
#' @import RCurl ROAuth
ROAuth_figshare <- function(cKey = getOption("FigshareKey", stop("Missing Figshare consumer key")),
    cSecret = getOption("FigsharePrivateKey", stop("Missing Figshare app secret")),
    curl = getCurlHandle(), ...) {
    reqURL <-  "http://api.figshare.com/v1/pbl/oauth/request_token"
    accessURL <- "http://api.figshare.com/v1/pbl/oauth/access_token"
    authURL <- "https://api.figshare.com/v1/pbl/oauth/authorize" 
    cred <- OAuthFactory$new(cKey, cSecret, reqURL, accessURL, authURL)
    cred$handshake()


#    figshare_oa <- oauth(cKey, cSecret, reqURL, authURL, accessURL, obj = new("FigshareCredentials"))
#    cred <- handshake(figshare_oa, post = FALSE, verify = ("Paste the PIN from the Figshare website here: "))
#    if (TRUE) {
#        cat("\n Figshare authentication was successful \n")
#        return(cred)
#    }

}

registerFigshareOAuth <- function(oauth) {
  require("ROAuth") || stop("ROAuth must be installed for ",
                            "OAuth functionality")
  if (!inherits(oauth, "OAuth"))
    stop("oauth argument must be of class OAuth")
  if (! oauth$getHandshakeComplete())
    stop("oauth has not completed its handshake")
  assign('oauth', oauth, envir=oauthCache)
  TRUE
}





#' An S4 class that stores Figshare credentials
#' @name FigshareCredentials-class
#' @rdname FigshareCredentials-class
#' @exportClass FigshareCredentials
# setClass("FigshareCredentials", contains = "OAuthCredentials")




