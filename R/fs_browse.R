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
#' @param session (optional) the authentication credentials from \code{\link{fs_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com/docs/howto.html#q-search}
#' @import httr
#' @export
#' @examples \dontrun{
#' fs_auth()
#' fs_search("Higgs", from_date="2012-04-01") 
#' } 
fs_search <- 
  function(author=NA, title=NA, description=NA, tag=NA, category=NA, from_date=NA, to_date=NA, mine=FALSE, public_only=FALSE, private_only=FALSE, drafts_only=FALSE, session = fs_get_auth()){

    base <- "http://api.figshare.com/v1"
  
    ## Fine assembling queries this way, but would be prettier
    ## using parameters to RCurl as in RMendeley...
    method <- "articles"
    if(mine)
      method <- "my_data/articles"
    if(public_only)
      method <- paste(method, "public", sep="/")
    if(private_only)
      method <- paste(method, "private", sep="/")
    if(drafts_only)
      method <- paste(method, "drafts", sep="/")
    if(!is.na(author))
      method <- paste(method, "&has_author=", author, sep="")
    if(!is.na(title))
      method <- paste(method, "&has_title=", title, sep="")
    if(!is.na(description))
      method <- paste(method, "&has_description=", description, sep="")
    if(!is.na(tag))
      method <- paste(method, "&has_tag=", tag, sep="")
    if(!is.na(category))
      method <- paste(method, "&has_category=", category, sep="")
    if(!is.na(from_date))
      method <- paste(method, "&from_date=", from_date, sep="")
    if(!is.na(to_date))
      method <- paste(method, "&to_date=", to_date, sep="")
    request = paste(base, method, sep="/")
    GET(request, session)
  }



