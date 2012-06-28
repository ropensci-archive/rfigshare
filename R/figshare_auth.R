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
#'@export figshare_auth
#'@examples \dontrun{
#' cred <- figshare_auth('YOUR_CONSUMER_KEY', 'YOUR_CONSUMER_SECRET')
#' cred <- figshare_auth() # If your keys are stored in options using
#' as FigshareKey and FigsharePrivateKey.
#'}
figshare_auth <- function(cKey = getOption("FigshareKey", stop("Missing Figshare consumer key")),
    cSecret = getOption("FigsharePrivateKey", stop("Missing Figshare app secret")),
    curl = getCurlHandle(), ...) {
    reqURL <- "http://api.figshare.com/my_data/articles" #"http://api.figshare.com/oauth/request_token/"

    accessURL <- reqURL #"http://api.figshare.com/oauth/access_token/"
    authURL <- reqURL #"http://api.figshare.com/oauth/authorize/"
    figshare_oa <- oauth(cKey, cSecret, reqURL, authURL, accessURL, obj = new("FigshareCredentials"))
    cred <- handshake(figshare_oa, post = FALSE, verify = ("Paste the PIN from the Figshare website here: "))
    if (TRUE) {
        cat("\n Figshare authentication was successful \n")
        return(cred)
    }
}



#' An S4 class that stores Figshare credentials
#' @name FigshareCredentials-class
#' @rdname FigshareCredentials-class
#' @exportClass FigshareCredentials
setClass("FigshareCredentials", contains = "OAuthCredentials")




library(httr)
figshare_auth <- function(cKey = getOption("FigshareKey", stop("Missing Figshare consumer key")),
    cSecret = getOption("FigsharePrivateKey", stop("Missing Figshare app secret"))){
  myapp <- oauth_app("figshare", key = cKey)
  sig <- sign_ouath1.0(myapp, 
  token = "",
  token_secret = cSecret)

  GET('http://api.figshare.com/my_data/authors?search_for=John Silva', sig)

}







