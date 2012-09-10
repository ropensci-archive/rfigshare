#' Add categories to article
#' 
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id the id number of the article 
#' @param categories a list of categories.  Either the category names or numeric codes must be supplied, see \code{\link{fs_show_categories}})
#' @param session (optional) the authentication credentials from \code{\link{fs_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com}
#' @import RJSONIO httr
#' @export
#' @examples \dontrun{
#' fs_auth()
#' fs_category(138, 10) 
#' }
fs_add_categories <- 
function(article_id, categories, session = fs_get_auth()){
  sapply(categories, function(category) fs_add_category(article_id, category, session))
}


#' Add a category to article
#' 
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id the id number of the article 
#' @param category_id Must be a category id number.  Support for actual category names coming soon.  
#' @param session (optional) the authentication credentials from \code{\link{fs_auth}}. If not provided, will attempt to load from cache as long as figshare_auth has been run.  
#' @return output of PUT request (invisibly)
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com}
#' @import RJSONIO httr
#' @export
#' @examples \dontrun{
#' fs_auth()
#' fs_category(138, 10) 
#' }
fs_add_category <- 
function(article_id, category_id, session = fs_get_auth()){
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", article_id, "categories", sep= "/")
  request <- paste(base, method, sep="/")
  body <- toJSON(list("category_id"=category_id))
  config <- c(verbose(), session, 
              add_headers("Content-Type" = "application/json"))
  
  for(i in 1:length(category_id)){
    body <- toJSON(list("category_id"=category_id[i]))
    config <- c(verbose(), session, 
                add_headers("Content-Type" = "application/json"))
    
     post <- PUT(request, config=config, body=body)
     invisible(post)
  }
}



