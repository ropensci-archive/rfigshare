#' Create a FigShare article (draft)
#'
#' Articles must be created with \code{\link{fs_create}}
#' with essential metadata.  Then you can add files with
#' \code{\link{fs_upload}}, add categories, tags or authors
#' with \code{\link{fs_add_categories}} or \code{\link{fs_add_tags}}
#' \code{\link{fs_add_authors}}.  Authors not registered with a FigShare
#' id can be created with \code{\link{fs_create_author}}.  You can
#' edit the original metadata with \code{\link{fs_update}}.
#' Finally, release the article as either private or public with
#' \code{\link{fs_make_private}} or \code{\link{fs_make_public}}.
#' Before creating the article, you must authenticate using
#' \code{\link{fs_auth}}.
#'
#' @export
#' @import methods httr
#' @param title for the article
#' @param description of the article
#' @param type one of: dataset, figure, media, poster, paper or fileset.
#' (Only filesets can have multiple uploaded files attached).
#' @param session the authentication credentials from \code{\link{fs_auth}}
#' @param debug print full post call return
#' @param ... curl options passed on to \code{\link[httr]{POST}}
#' @return article id
#' @seealso \code{\link{fs_auth}}, \code{\link{fs_upload}}
#' @references \url{http://api.figshare.com}
#' @examples \dontrun{
#' # set your auth token, see ?fs_auth for more info
#' # fs_auth("your token")
#'
#' fs_create(title = "My Title", description="A description of the object",
#'   type="dataset")
#' fs_create(title = "My other title", description="Apples and bananas",
#'   type="dataset")
#' }
fs_create <- function(title, description,
  type = c("dataset", "figure", "media", "poster", "paper", "fileset"),
  session = fs_get_auth(), debug = FALSE, ...) {

  # TODO: Return (or at least message) the article ID number.  Error
  # handling for types?
  type <- match.arg(type)
  base <- "https://api.figshare.com/v2"
  method <- "account/articles"
  request <- paste(base, method, sep = "/")
  meta <- jsonlite::toJSON(list("title" = title,
                      "description" = description,
                      "defined_type" = type))
  config <- c(session, add_headers("Content-Type" = "application/json"))
  post <- httr::POST(request, config = config, body = meta, ...)
  if (debug | post$status_code > 201) {
    post
  } else {
    p <- jsonlite::fromJSON(cont(post))
    article_id <- as.numeric(strextract(p$location, "[0-9]+$"))

    # if (is.numeric(article_id)) {
    #   message(paste("Your article has been created! Your id number is", article_id))
    # }
    message(
      paste("Your article has been created! Your id number is", article_id)
    )
    article_id
  }
}
