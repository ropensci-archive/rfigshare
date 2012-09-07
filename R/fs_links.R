#' Add a link to article 
#'
#' Adds a url link to the metadata of an article 
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param link the url you wish to add 
#' @param article_id the id number of the article 
#' @param session (optional) the authentication credentials from \code{\link{fs_auth}}. If not provided, will attempt to load from cache as long as authentication has been run.  
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com}
#' @import RJSONIO httr
#' @export
#' @examples \dontrun{
#' fs_auth()
#' fs_add_link(138, "http://carlboettiger.info") 
#' }
fs_add_link <- 
function(article_id, link, session = fs_get_auth()){
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", article_id, "links", sep= "/")
  request <- paste(base, method, sep="/")
  body <- toJSON(list("link"=link))
  config <- c(verbose(), session, 
              add_headers("Content-Type" = "application/json"))
   post <- PUT(request, config=config, body=body)
  invisible(post)
}



