#' Create a FigShare article (draft)
#'
#' Articles must be created with [fs_create()]
#' with essential metadata.  Then you can add files with
#' [fs_upload()], add categories, tags or authors
#' with [fs_add_categories()] or [fs_add_tags()]
#' [fs_add_authors()].  Authors not registered with a FigShare
#' id can be created with [fs_create_author()].  You can
#' edit the original metadata with [fs_update()].
#' Finally, release the article as either private or public with
#' [fs_make_private()] or [fs_make_public()].
#' Before creating the article, you must authenticate using
#' [fs_auth()].
#'
#' @export
#' @param title for the article
#' @param description of the article
#' @param type one of: dataset, figure, media, poster, paper or fileset.
#' (Only filesets can have multiple uploaded files attached).
#' @param session the authentication credentials from [fs_auth()]
#' @param debug print full post call return
#' @param ... curl options passed on to [httr::POST()]
#' @return article id
#' @seealso [fs_auth()], [fs_upload()]
#' @references http://api.figshare.com
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
                      "defined_type" = type), auto_unbox = TRUE)
  config <- c(session, add_headers("Content-Type" = "application/json"))
  post <- httr::POST(request, config = config, body = meta, verbose())
  if (debug | post$status_code > 201) {
    stop_for_status(post)
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
