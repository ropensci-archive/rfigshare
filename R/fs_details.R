
#' Get details for an article
#'
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id number
#' @param mine logical (default FALSE). Set to true to see article details for your own non-public articles
#' @param session the authentication credentials from \code{\link{fs_auth}}
#' @param show_versions logical, show what versions are available
#' @param version show a given version number
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com}
#' @import httr
#' @export
#' @examples \dontrun{
#' fs_details(138)
#' }
fs_details <- 
  function(article_id, mine=FALSE, session = fs_get_auth(),
         show_versions=FALSE, version=NULL){
    base <- "http://api.figshare.com/v1"

    if(mine)
      method <- paste("my_data/articles", article_id, sep="/")
    else if(!mine)
      method <- paste("articles", article_id, sep="/")

    if(show_versions)
      method <- paste(method, "versions", sep="/")
    if(!is.null(version))
      method <- paste(method, version, sep="/")
    request = paste(base, method, sep="/")
    out <- GET(request, session)
    ## TODO: add class for info and pretty print summary 
    parsed_out <- parsed_content(out)
    output <- parsed_out$items[[1]]
    class(output) <- "fs_object"
    output
  }



