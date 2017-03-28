#' Advanced Search.
#'
#' FIXME: working on figuring out what parameters can be passed to search,
#' only using query, limit, offset, order_by, order for now.
#'
#' Search function that will filter on matching timestamp, author, title,
#' description, tag, category, and date range.  Query searches against matches
#' in any metadata field.  Full-text searches coming soon.
#'
#' @export
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' Scott Chamberlain \email{myrmecocystus@@gmail.com}
#' @param query the search query
#' @param author Show only results by this author
#' @param title Show only results matching or partially matching this title
#' @param description Show only results matching or partially matching this
#' description
#' @param tag Show only results matching this tag
#' @param category Show only results matching this category
#' @param from_date Start time window for search. Date format is YYYY-MM-DD
#' @param to_date Ending time window for search. Date format is YYYY-MM-DD
#' @param mine Browse only articles owned by user. default is `FALSE`
#' Not functional. Use [fs_browse()] instead.
#' @param public_only (for use with mine=TRUE only) browse only my public
#' articles. default is `FALSE`
#' @param private_only (for use with mine=TRUE only) browse only my private
#' articles. default is `FALSE`
#' @param drafts_only (for use with mine=TRUE only) browse only my draft
#' articles. default is `FALSE`
#' @param session (optional) the authentication credentials from
#' \code{\link{fs_auth}}. If not provided, will attempt to load from cache
#' as long as figshare_auth has been run.
#' @param base the API access url
#' @param debug logical, enable debugging mode
#' @param limit (integer) number of results to return
#' @param offset (integer) offset - record to start at
#' @param order_by order by
#' @param order order
#' @param ... curl options passed on to [httr::POST()]
#' @return output of PUT request (invisibly)
#' @seealso [fs_auth()] [fs_browse()]
#' @references \url{http://api.figshare.com/docs/howto.html#q-search}
#' @examples \dontrun{
#' # set your auth token, see ?fs_auth for more info
#' # fs_auth("your token")
#'
#' fs_search(query = "Boettiger")
#' fs_search(author = "Boettiger")
#' fs_search("Boettiger", author = "Carl", from="2014-01-01")
#' fs_search("Boettiger", author = "Carl", from="2014-01-01",
#'           category = "Evolutionary Biology")
#'
#' }
fs_search <- function(query = NULL, author = NULL, title = NULL,
                      description = NULL, tag = NULL, category = NULL,
                      from_date = NULL, to_date = NULL, mine = FALSE,
                      public_only = FALSE, private_only = FALSE,
                      drafts_only = FALSE, session = fs_get_auth(),
           limit = 10,
           offset = 0,
           order_by = NULL,
           order = NULL,
           base = "https://api.figshare.com/v2",
           debug = FALSE,
           ...) {

    # resolve name conflict?
    the_title <- title

    method <- "articles/search"
    if (mine) method <- "account/articles/search"

    if (!is.null(author)) author <- sprintf(":author: %s", author)
    if (!is.null(title)) title <- sprintf(":title: %s", title)
    if (!is.null(description)) description <- sprintf(":description: %s", description)
    query <- paste0(comp(c(query, author, title, description)), collapse = " ")

    request <- paste(base, method, sep = "/")
    body <- comp(list(search_for = query, limit = limit, offset = offset,
                      order = order_by, order_direction = order))
    out <- httr::POST(request, session, body = body, encode = "json", verbose())
    jsonlite::fromJSON(cont(out))
}
