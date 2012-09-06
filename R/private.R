#' Make an article private (draft only?)
#' 
#' @author Carl Boettiger \email{cboettig@gmail.com}
#' @param article_id the id number of the article 
#' @param session (optional) the authentication credentials from \code{\link{figshare_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{figshare_auth}}
#' @references \url{http://api.figshare.com}
#' @export
#' @examples \dontrun{
#' figshare_auth()
#' figshare_private(123)
#' }
figshare_private <- function(article_id, session = fs_get_auth()){
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", article_id, "action/make_private", sep="/")
    request = paste(base, method, sep="/")
  POST(request, session)
}
