#' Browse articles 
#'
#' Browse can be set to all public articles, the users own articles, 
#' Browse can filter on matching timestamp, author, title, description, tag, category, and date range.    
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param mine Logical, show only my (authenticated user's) articles. Defaults to FALSE, browse all public articles.  
#' @param public_only (for use with mine=TRUE only) browse only my public articles. default is FALSE
#' @param private_only (for use with mine=TRUE only) browse only my private articles. default is FALSE
#' @param drafts_only (for use with mine=TRUE only) browse only my draft articles. default is FALSE
#' @param session (optional) the authentication credentials from \code{\link{fs_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @param base the API access url
#' @param query a search query tern (equivalent to calling fs_search)
#' @details NOTE: CURRENTLY FILTERING IN BROWSE MODE IS NOT SUPPORTED BY THE API, other than mine, public, private, drafts_only
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com/docs/howto.html#q-search}
#' @import httr
#' @export
#' @examples \dontrun{
#' fs_browse(mine=TRUE) 
#' } 
fs_browse <- function(mine=FALSE, public_only=FALSE, private_only=FALSE, drafts_only=FALSE, session = fs_get_auth(), base = "http://api.figshare.com/v1", query=NA){

    method <- "articles"
    if(mine)
      method <- "my_data/articles"
    if(public_only)
      method <- paste(method, "/public", sep="")  # visibility only works in my_data
    if(private_only)
      method <- paste(method, "/private", sep="") # visibility only works in my_data
    if(drafts_only)
      method <- paste(method, "/drafts", sep="")  # visibility only works in my_data

    request = paste(base, method, sep="/")
    out <- GET(request, session)
    parsed <- parsed_content(out)
    parsed$items

# CURRENTLY BROWSE ONLY RETURNS most recent 10 hits.  Cannot even specify the page of results.  
#'      method = "articles"
#'      all <- lapply(1:total_pages, function(i){
#'        method_ <- paste(method, "&page=", i, sep="")
#'        request = paste(base, method_, sep="/")
#'        out <- GET(request, session)
#'        parsed <- parsed_content(out)
#'        parsed$items
#'      })
#'      out <- unlist(all, recursive = FALSE)

#  fs_search(query, author, title, description, tag, category, from_date, to_date, mine, public_only, private_only, drafts_only, session = fs_get_auth(), base = "http://api.figshare.com/v1")  
}
