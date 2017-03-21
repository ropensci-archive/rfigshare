#' Get details for an article
#'
#' @export
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id number
#' @param mine logical (default FALSE). Set to true to see article details for your own non-public articles
#' @param session the authentication credentials from \code{\link{fs_auth}}
#' @param show_versions logical, show what versions are available
#' @param version show a given version number
#' @param debug logical, enable debugging mode?
#' @param ... curl options passed on to \code{\link[httr]{GET}}
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com}
#' @examples \dontrun{
#' # set your auth token, see ?fs_auth for more info
#' # fs_auth("your token")
#'
#' fs_details(article_id = 1097652)
#' }
fs_details <-
  function(article_id, mine = is_mine(article_id),
           session = fs_get_auth(),
           show_versions = FALSE,
           version = NULL,
           debug = FALSE, ...){
    base <- "https://api.figshare.com/v2"

    if(mine){
      method <- paste("account/articles", article_id, sep = "/")
    } else if(!mine) {
      # v1 did not provide version info
      base <- "http://api.figshare.com/v2"
      method <- paste("articles", article_id, sep = "/")
    }

    if(show_versions)
      method <- paste(method, "versions", sep = "/")
    if(!is.null(version))
      method <- paste(method, "versions", version, sep = "/")
    request = paste(base, method, sep = "/")

    out <- GET(request, session, ...)
    if(debug | out$status_code != 200) {
      out
    } else {
      jsonlite::fromJSON(cont(out))
      #output <- parsed_out$items[[1]]
      #class(out) <- "fs_object"
      #out
    # out <- GET(request, config(token = session))

    # if(debug | out$status_code != 200)
    #   out
    # else {
    #   parsed_out <- RJSONIO::fromJSON(content(out, "text"))
    #   output <- parsed_out

    #   if(mine){
    #     # mine uses v1 api
    #     output <- parsed_out$items[[1]]
    #   } else {
    #     output <- parsed_out
    #   }
    #   class(output) <- "fs_object"
    #   output
    }
  }


is_mine <- function(id){
  a <- fs_browse(mine = TRUE)
 !is.na(match(id, a$id))
}


