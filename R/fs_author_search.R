#' Search for an author
#'
#' Function to search for authors 
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param author a string to search for (name, can include spaces)
#' @param session (optional) the authentication credentials from \code{\link{fs_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com}
#' @import httr
#' @export
#' @examples \dontrun{
#' fs_author_search("Boettiger") 
#' } 
fs_author_search <- 
  function(author, session = fs_get_auth()){
    base <- "http://api.figshare.com/v1"
    method <- paste("my_data/authors?search_for=", author, sep="")
    request = paste(base, method, sep="/")
    output <- GET(request, session)
    parsed_content(output)$items
  }



