#' Get details for an article
#'
#' @export
#' @import httr
#' @importFrom utils download.file
#' @importFrom utils select.list
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id (numeric) a Figshare object ID
#' @param urls_only (logical) to only return the URLs to the
#' downloadable objects but do not call download.file.  If FALSE, will download
#' files. Default: TRUE
#' @param mine (logical) Set to true to see article details for
#' your own non-public articles. Default: FALSE
#' @param session the authentication credentials from \code{\link{fs_auth}}
#' @param show_versions logical, show what versions are available
#' @param version show a given version number
#' @param ... additional arguments to \code{\link[curl]{curl_download}}
#' @seealso \code{\link{fs_auth}} \code{\link[curl]{curl_download}}
#' @references \url{https://docs.figshare.com/}
#' \url{https://github.com/ropensci/rfigshare}
#' @examples \dontrun{
#' url <- fs_download(article_id = 90818)
#' data <- read.csv(url)
#' articles <- fs_search("SciFund")
#' ids <- fs_ids(articles)
#' fs_download(ids, urls_only=FALSE)
#' }
fs_download <- function(article_id, urls_only = TRUE, mine=is_mine(article_id),
                        session = fs_get_auth(), show_versions=FALSE,
                        version=NULL, ...) {

  details <- lapply(article_id, fs_details, mine = mine, session = session,
                    show_versions = show_versions, version = NULL)
  filenames <- unlist(sapply(details, function(x) x$files$name))
  urls <- unlist(sapply(details, function(x) x$files$download_url))

  if (!urls_only) {
    sapply(seq_along(urls), function(i)
      curl::curl_download(urls[i], filenames[i], ...)
    )
  }
  return(urls)
}
