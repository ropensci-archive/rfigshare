#' Search for an author
#' @param author a string to search for (name, can include spaces)
#' @param session authentication object from figshare_auth()
#' @export
figshare_author_search <- 
  function(author, session){
    base <- "http://api.figshare.com/v1"
    method <- paste("my_data/authors?search_for=", author, sep="")
    request = paste(base, method, sep="/")
    GET(request, session)
  }



