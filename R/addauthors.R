#' Add authors to article
#' @param author_id the id number of a registered figshare user (see figshare_search_authors)
#' @param article_id id number of an article on figshare 
#' @param the session authentication token from figshare_auth
#' @return adds the requested author to the given article
#' @export
#' @import RJSONIO
figshare_addauthors <- function(author_id, article_id, session){
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", article_id, "authors", sep= "/")
  request = paste(base, method, sep="/")
  body <- toJSON(list("author_id"=author_id, "Content-Type" = "application/json"))
  out <- PUT(request, config=session, body=body)
}

