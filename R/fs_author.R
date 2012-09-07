#' Add author to an article
#' 
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id id number of an article on figshare 
#' @param author_id the id number of a registered figshare user (see \code{\link{fs_author_search}})
#' @param session (optional) the authentication credentials from \code{\link{fs_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return adds the requested author to the given article
#' @import RJSONIO
#' @export
#' @examples \dontrun{
#'  fs_auth()
#'  fs_add_author("123", "456")
#' } 
fs_add_author <- function(article_id, author_id, session = fs_get_auth()){
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", article_id, "authors", sep= "/")
  request = paste(base, method, sep="/")
  body <- toJSON(list("author_id"=author_id))
  config <- c(verbose(), session, 
              add_headers("Content-Type" = "application/json"))
  out <- PUT(request, config=config,  body=body)
}

