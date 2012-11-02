#' Browse articles 
#'
#' Browse can be set to all public articles, the users own articles, 
#' Browse can filter on matching timestamp, author, title, description, tag, category, and date range.    
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param mine Logical, show only my (authenticated user's) articles. Defaults to FALSE, browse all public articles.  
#' @param author Show only results by this author
#' @param title Show only results matching or partially matching this title
#' @param description Show only results matching or partially matching this description
#' @param tag Show only results matching this tag
#' @param category Show only results matching this category
#' @param from_date Start time window for search. Date format is YYYY-MM-DD
#' @param to_date Ending time window for search. Date format is YYYY-MM-DD
#' @param mine Browse only articles owned by user. default is FALSE
#' @param public_only (for use with mine=TRUE only) browse only my public articles. default is FALSE
#' @param private_only (for use with mine=TRUE only) browse only my private articles. default is FALSE
#' @param drafts_only (for use with mine=TRUE only) browse only my draft articles. default is FALSE
#' @param session (optional) the authentication credentials from \code{\link{fs_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com/docs/howto.html#q-search}
#' @import httr
#' @export
#' @examples \dontrun{
#' fs_auth()
#' fs_browse(mine=TRUE) 
#' } 
fs_browse <- function(author=NA, title=NA, description=NA, tag=NA, category=NA, from_date=NA, to_date=NA, mine=FALSE, public_only=FALSE, private_only=FALSE, drafts_only=FALSE, session = fs_get_auth(), base = "http://api.figshare.com/v1", query=NA){

  fs_search(query, author, title, description, tag, category, from_date, to_date, mine, public_only, private_only, drafts_only, session = fs_get_auth(), base = "http://api.figshare.com/v1")  
}
