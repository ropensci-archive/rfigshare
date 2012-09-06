#' Delete article (private or drafts only) 
#' 
#' @author Carl Boettiger \email{cboettig@gmail.com}
#' @param article_id the id number of the article 
#' @param session (optional) the authentication credentials from \code\link{{figshare_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return output of DELETE request (invisibly) 
#' @seealso \code{\link{figshare_auth}}
#' @references \url{http://api.figshare.com}
#' @import RJSONIO
#' @export
#' @examples \dontrun{
#' figshare_auth()
#' figshare_delete(123)
#' }
figshare_delete <- 
function(article_id, session = fs_get_auth()){
  require(RJSONIO)
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", article_id, sep= "/")
  request <- paste(base, method, sep="/")
  del <- DELETE(request, config=config)
  invisible(del)
}



