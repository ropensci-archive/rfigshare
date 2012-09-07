#' Create a FigShare article (draft)
#' 
#' Articles must be created with \code{\link{figshare_create}}
#' with essential metadata.  Then you can add files with
#' \code{\link{figshare_upload}}, add categories, tags or authors
#' with \code{\link{figshare_category}} or \code{\link{figshare_tag}}
#' \code{\link{figshare_author}}.  Authors not registered with a FigShare
#' id can be created with \code{\link{figshare_create_author}}.  You can
#' edit the original metadata with \code{\link{figshare_update}}.
#' Finally, release the article as either private or public with
#' \code{\link{figshare_private}} or \code{\link{figshare_public}}.
#' Before creating the article, you must authenticate using
#' \code{\link{figshare_auth}}.
#' @param title for the article
#' @param description of the article
#' @param type one of: dataset, figure, media, poster, or paper
#' @param session the authentication credentials from \code{\link{figshare_auth}}
#' @return output of post request (invisibly)
#' @seealso \code{\link{figshare_auth}}
#' @references \url{http://api.figshare.com}
#' @import RJSONIO
#' @export
#' @examples \dontrun{
#' sig <- figshare_auth()
#' figshare_create("My Title", "A description of the object", "dataset")
#' }
figshare_create <- 
function(title, description, type = 
         c("dataset", "figure", "media", "poster", "paper"),
         session = fs_get_auth()){
# TODO: Return (or at least message) the article ID number.  Error handling for types?

  type <- match.arg(type)
  base <- "http://api.figshare.com/v1"
  method <- "my_data/articles"
  request <- paste(base, method, sep="/")
  meta <- toJSON(list("title"=title, "description"=description, 
                      "defined_type"=type))
  config <- c(verbose(), session, 
              add_headers("Content-Type" = "application/json"))
   post <- POST(request, config=config, body=meta)
  invisible(post)
}



