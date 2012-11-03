
#' Creates a figshare author 
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param full_name full name of the author to create
#' @param session (optional) the authentication credentials from \code{\link{fs_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return author ID numbers
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com}
#' @import RJSONIO
#' @export
#' @examples \dontrun{
#' figshare_create_author("Benjamin Franklin") 
#' } 
fs_create_author <- 
function(full_name, session = fs_get_auth()){
  base <- "http://api.figshare.com/v1"
  method <- "my_data/authors"
  request <- paste(base, method, sep="/")
  for(i in 1:length(full_name)){ 
    body <- toJSON(list("full_name"=full_name[i]))
    config <- c(verbose(), session, 
              add_headers("Content-Type" = "application/json"))
    post <- PUT(request, config=config, body=body)
    invisible(post)
  }
}



