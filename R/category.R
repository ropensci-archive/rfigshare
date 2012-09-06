#' Add category to article
#' 
#' @author Carl Boettiger \email{cboettig@gmail.com}
#' @param category_id Must be a category id number.  Support for actual category names coming soon.  
#' @param article_id the id number of the article 
#' @param session (optional) the authentication credentials from \code{\link{figshare_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{figshare_auth}}
#' @references \url{http://api.figshare.com}
#' @import RJSONIO httr
#' @export
#' @examples \dontrun{
#' figshare_auth()
#' figshare_category(10) 
#' }
figshare_category <- 
function(category_id, article_id, session = fs_get_auth()){
  require(RJSONIO)
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", article_id, "categories", sep= "/")
  request <- paste(base, method, sep="/")
  body <- toJSON(list("category_id"=category_id))
  config <- c(verbose(), session, 
              add_headers("Content-Type" = "application/json")
   post <- PUT(request, config=config, body=body)
  invisible(post)
}



