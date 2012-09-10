

#' Create a FigShare article.  
#' 
#' fs_new_article is a wrapper around many other rfigshare commands to provide convenient posting.   
#' @param title for the article, see \code{\link{fs_create}} for details.
#' @param description of the article, see \code{\link{fs_create}} for details.
#' @param type one of: dataset, figure, media, poster, or paper, see \code{\link{fs_create}} for details. 
#' @param session the authentication credentials from \code{\link{fs_auth}}
#' @param authors Orded list of authors for the article, see \code{\link{fs_add_authors}} for details
#' @param categories list of categories or category id numbers, see \code{\link{fs_add_categories}} for details.   
#' @param tags list of tags, see \code{\link{fs_add_tags}} for details.   
#' @param links list of links to add, see \code{\link{fs_add_links}} for details
#' @param visibility one of "draft", "private" or "public".  A draft document can still be edited and modified.  A public document is visible to everyone and cannot be deleted (though additional authors to the work can still "claim" their authorship).  
#' @param session (optional) credentials, see \code{link{fs_auth}}
#' @return article id 
#' @seealso \code{\link{fs_auth}}, \code{\link{fs_add_categories}}, \code{\link{fs_add_authors}}, \code{\link{fs_add_tags}}, \code{\link{fs_add_links}}
#' @references \url{http://api.figshare.com}
#' @import RJSONIO
#' @export
#' @examples \dontrun{
#' fs_auth()
#' fs_
#' }

fs_new_article <- function(title, description, type = 
         c("dataset", "figure", "media", "poster", "paper", "fileset"),
         categories = NA, tags = NA, authors = NA,
         links = NA, files = NA, 
         visibility = c("draft", "private", "public"),
         session = fs_get_auth()){

  article_id <- fs_create(title=title, description=description, 
              type=type, session=session, verbose=verbose)
  visibility <- match.arg(visibility)
  if(!is.na(authors))
    fs_add_authors(article_id, authors, session)
  if(!is.na(categories))
    fs_add_categories(article_id, categories, session)
  if(!is.na(tags))
    fs_add_tags(article_id, tags, session)
  if(!is.na(links))
    fs_add_links(article_id, links, session)
  if(!is.na(files))
    fs_upload(article_id, files, session)
  if(visibility == "private")
    fs_make_private(article_id, session)
  if(visibility == "public")
    fs_make_public(article_id, session)

  article_id
}


