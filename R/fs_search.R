#' Advanced Search 
#'
#' Search function that will filter on matching timestamp, author, title, description, tag, category, and date range.  Query searches against matches in any metadata field.  Full-text searches coming soon.  
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param query the search query
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
  function(query, author=NA, title=NA, description=NA, tag=NA, category=NA, from_date=NA, to_date=NA, session = fs_get_auth()){
    base <- "http://api.figshare.com/v1"

    ## Fine assembling queries this way, but would be prettier
    ## using parameters to RCurl as in RMendeley...
    method <- paste("articles/search?search_for=", query, sep="")
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
    out <- GET(request, session)
    parsed <- parsed_content(out)

    total_pages <- ceiling(parsed$items_found / 10)
    all <- lapply(1:total_pages, function(i){
      method_ <- paste(method, "&page=", i, sep="")
      request = paste(base, method_, sep="/")
      out <- GET(request, session)
      parsed <- parsed_content(out)
      parsed$items
    })
    all
  }



