#' Get a list of article id numbers from a search return
#'
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param object the output of a search
#' @return a list of article id numbers
#' @references \url{http://api.figshare.com}
#' @import httr
#' @export
#' @examples \dontrun{
#' # figshare_category()
#'
#' articles <- fs_search("SciFund")
#' fs_ids(articles)
#' }
fs_ids <- function(object) {
  assert(object, "data.frame")
  stopifnot("id" %in% names(object))
  object$id
}
