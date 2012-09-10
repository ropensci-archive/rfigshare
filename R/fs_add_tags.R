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
fs_add_tags <- function(article_id, tags, session=fs_get_auth()){
  sapply(tags, function(tag) fs_add_tag(article_id, tag, session=session))
}


#' Add a tag to an article
#' 
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id the id number of the article to create
#' @param tag name of the tag to add
#' @param session the authentication credentials from \code{\link{fs_auth}}
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com}
#' @import RJSONIO
#' @keywords internal
#' @examples \dontrun{
#'  fs_auth()
#'  fs_add_tag(138, "phylogenetics") 
#' }
fs_add_tag <- 
function(article_id, tag, session = fs_get_auth()){
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", article_id, "tags", sep= "/")
  request <- paste(base, method, sep="/")
  
  for(i in 1:length(tag)){
   body <- toJSON(list("tag_name" = tag[i]))
   config <- c(verbose(), session, 
              add_headers("Content-Type" = "application/json"))
    post <- PUT(request, config=config, body=body)
   invisible(post)
  }
}


