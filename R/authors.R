#' Add authors to an article
#' 
#' @author Carl Boettiger \email{cboettig@gmail.com}
#' @param author_id the id number of a registered figshare user (see figshare_search_authors)
#' @param article_id id number of an article on figshare 
#' @param session (optional) the authentication credentials from \code{\link{figshare_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return adds the requested author to the given article
#' @import RJSONIO
#' @export
#' @examples \dontrun{
#'  figshare_auth()
#'  figshare_authors("123", "456")
#' } 
figshare_authors <- function(author_id, article_id, session = fs_get_auth()){
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", article_id, "authors", sep= "/")
  request = paste(base, method, sep="/")
  body <- toJSON(list("author_id"=author_id))
  config <- c(verbose(), session, 
              add_headers("Content-Type" = "application/json")
  out <- PUT(request, config=config,  body=body)
}

