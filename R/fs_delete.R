#' Delete article (private or drafts only) 
#' 
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id the id number of the article 
#' @param session (optional) the authentication credentials from \code{\link{fs_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return output of DELETE request (invisibly) 
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com}
#' @import RJSONIO
#' @export
#' @examples \dontrun{
#' fs_delete(123)
#' }
fs_delete <- 
function(article_id, session = fs_get_auth()){
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", article_id, sep= "/")
  request <- paste(base, method, sep="/")
  config = c(verbose(), session)
  del <- DELETE(request, config=config)
  invisible(del)
}



