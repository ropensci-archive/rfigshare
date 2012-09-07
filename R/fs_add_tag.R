#' Add tags to article
#' 
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id the id number of the article to create
#' @param tag name of the tag to add
#' @param session the authentication credentials from \code{\link{fs_auth}}
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com}
#' @import RJSONIO
#' @export
#' @examples \dontrun{
#'  fs_auth()
#'  fs_add_tag(138, "phylogenetics") 
#' }
fs_add_tag <- 
function(article_id, tag, session = fs_get_auth()){
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", article_id, "tags", sep= "/")
  request <- paste(base, method, sep="/")
  body <- toJSON(list("tag_name" = tag))
  config <- c(verbose(), session, 
              add_headers("Content-Type" = "application/json"))
   post <- PUT(request, config=config, body=body)
  invisible(post)
}



