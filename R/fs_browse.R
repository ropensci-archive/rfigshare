#' Browse articles
#'
#' Browse can be set to all public articles, the users own articles,
#' Browse can filter on matching timestamp, author, title, description, tag,
#' category, and date range.
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param mine Logical, show only my (authenticated user's) articles.
#' Defaults to TRUE.
#' @param public_only (for use with mine=TRUE only) browse only my public
#' articles. default is FALSE
#' @param private_only (for use with mine=TRUE only) browse only my private
#' articles. default is FALSE
#' @param drafts_only (for use with mine=TRUE only) browse only my draft
#' articles. default is FALSE
#' @param session (optional) the authentication credentials from
#' \code{\link{fs_auth}}. If not provided, will attempt to load from cache as
#' long as figshare_auth has been run.
#' @param base the API access url
#' @param query a search query term (equivalent to calling fs_search)
#' @param debug enable debugging mode
#' @param ... curl options passed on to \code{\link[httr]{GET}}
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com/docs/howto.html#q-search}
#' @import httr
#' @export
#' @examples \dontrun{
#' fs_browse()
#' fs_browse(mine = FALSE)
#' fs_browse(public_only = TRUE)
#' fs_browse(mine = FALSE, public_only = FALSE)
#' }


fs_browse <- function(mine = TRUE, public_only = FALSE, private_only = FALSE,
                      drafts_only = FALSE, session = fs_get_auth(),
                      base = "https://api.figshare.com/v2", query=NA,
                      debug = FALSE, ...){

    method <- "articles"
    if(mine)
      method <- "account/articles"
    if(public_only)
      # visibility only works in my_data
      method <- paste(method, "/public", sep = "")
    if(private_only)
      # visibility only works in my_data
      method <- paste(method, "/private", sep = "")
    if(drafts_only)
      # visibility only works in my_data
      method <- paste(method, "/drafts", sep = "")

    request = paste(base, method, sep = "/")
    out <- GET(request, session, ...)

    if (debug | out$status_code != 200) {
      out
    } else {
      jsonlite::fromJSON(cont(out))
    }

# CURRENTLY BROWSE ONLY RETURNS most recent 10 hits.
    # Cannot even specify the page of results.
#      all <- lapply(1:total_pages, function(i){
#        method_ <- paste(method, "&page=", i, sep="")
#        request = paste(base, method_, sep="/")
#        out <- GET(request, session)
#        parsed <- parsed_content(out)
#        parsed$items
#      })
#      out <- unlist(all, recursive = FALSE)

}


## All page requests fail
## response <- GET("http://api.figshare.com/v1/my_data/articles&page=1",
## config(token = fs_auth()))
