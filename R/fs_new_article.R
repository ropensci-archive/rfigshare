

#' Create a FigShare article.  
#' 
#' fs_new_article is a wrapper around many other rfigshare commands to provide convenient posting.   
#' @param title for the article
#' @param description of the article
#' @param type one of: dataset, figure, media, poster, or paper
#' @param session the authentication credentials from \code{\link{fs_auth}}
#' @param verbose print full post call return
#' @param authors Orded list of authors for the article
#' @return article id 
#' @seealso \code{\link{fs_auth}}
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
         visibility = c("draft", "private", "public")
         session = fs_get_auth(), verbose=FALSE){

  article_id <- fs_create(title=title, description=description, 
              type=type, session=session, verbose=verbose)
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
}



