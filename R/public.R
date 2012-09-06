#' Make an article public (for private or draft articles)
#'
#' NOTE: Public articles are assigned DOIs and cannot be deleted or made private once declared public! Public articles do not count against your quota space.  
#' @author Carl Boettiger \email{cboettig@gmail.com}
#' @param article_id the id number of the article 
#' @param session (optional) the authentication credentials from \code{\link{figshare_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{figshare_auth}}
#' @references \url{http://api.figshare.com}
#' @export
#' @examples \dontrun{
#' sig <- figshare_auth()
#' figshare_public(123)
#' }
figshare_public <- function(article_id, session = fs_get_auth()){
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", article_id, "action/make_public", sep="/")
    request = paste(base, method, sep="/")
  POST(request, session)
}


