#' Update article title, description, or type 
#'
#' Updates the article title, description or type. If any is not specified, it will remain unchanged.  
#' @author Carl Boettiger \email{cboettig@gmail.com}
#' @param article_id the id number of the article 
#' @param title for the article (to replace original title)
#' @param description of the article (replaces original designation)
#' @param type one of: dataset, figure, media, poster, or paper (replaces original designation)
#' @param session (optional) the authentication credentials from \code{\link{figshare_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{figshare_auth}}
#' @references \url{http://api.figshare.com}
#' @import RJSONIO
#' @export
#' @examples \dontrun{
#' figshare_auth()
#' figshare_update(10) 
#' }
figshare_update <- 
function(article_id, title=NA, description=NA, type = NA,
         session = fs_get_auth()){

  ## grab the article details and use those as defaults
  details <- figshare_details(article_id, session)
  if(is.na(title))
    title <- details$title
  if(is.na(description))
    description <- details$description
  if(is.na(type))
    type <- details$defined_type

  require(RJSONIO)
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", article_id, sep= "/")
  request <- paste(base, method, sep="/")
  meta <- toJSON(list("title"=title, "description"=description, 
                      "defined_type"=type))
  config <- c(verbose(), session, 
              add_headers("Content-Type" = "application/json")
  post <- PUT(request, config=config, body=meta)
  invisible(post)
}



