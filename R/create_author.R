
#' Creates a figshare author 
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param full_name full name of the author to create
#' @param session (optional) the authentication credentials from \code{\link{figshare_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{figshare_auth}}
#' @references \url{http://api.figshare.com}
#' @import RJSONIO
#' @export
#' @examples \dontrun{
#' sig <- figshare_auth()
#' figshare_create_author("Benjamin Franklin") 
#' } 
figshare_create_author <- 
function(full_name, session = fs_get_auth()){
  base <- "http://api.figshare.com/v1"
  method <- "my_data/authors"
  request <- paste(base, method, sep="/")
  body <- toJSON(list("full_name"=full_name))
  config <- c(verbose(), session, 
              add_headers("Content-Type" = "application/json"))
   post <- PUT(request, config=config, body=body)
  invisible(post)
}



