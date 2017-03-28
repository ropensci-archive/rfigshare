
#' Creates a figshare author
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param full_name full name of the author to create
#' @param session (optional) the authentication credentials from
#' [fs_auth()]. If not provided, will attempt to load from cache as
#' long as figshare_auth has been run.
#' @param debug return PUT request visibly?
#' @return author ID numbers
#' @seealso [fs_auth()]
#' @references http://api.figshare.com
#' @export
#' @examples \dontrun{
#' fs_create_author(full_name = "Benjamin Franklin")
#' }
fs_create_author <- function(full_name, article_id, session = fs_get_auth(),
                             debug = FALSE) {

  base <- "https://api.figshare.com/v2"
  method <- sprintf("account/articles/%s/authors", article_id)
  request <- paste(base, method, sep = "/")
  #body <- jsonlite::toJSON(list("full_name" = full_name), auto_unbox = TRUE)
  body <- list("full_name" = full_name)
  config <- c(config(token = session),
            add_headers("Content-Type" = "application/json"))
  url <- build_url(parse_url(request)) # perform % encoding
  post <- POST(url, body = body, session, content_type_json(), encode = "json", verbose())
  if (debug) {
    post
  } else if (post$status_code == 400) { # Return id if already registered
    warning(jsonlite::fromJSON(cont(post)))
#    fs_author_search(full_name)[[1]]$id # not working at this time
  } else if (post$status_code == 201) {
    p <- jsonlite::fromJSON(cont(post))
    p$id
  }
}
