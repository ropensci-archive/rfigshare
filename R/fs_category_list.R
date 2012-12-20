
#' List all categories
#'
#' @return a table of all the categories 
#' @references \url{http://api.figshare.com}
#' @import httr 
#' @export
#' @examples \dontrun{
#' fs_categories_list()
#' }
fs_category_list <- function(){
    a <- content(GET("http://api.figshare.com/v1/categories"), as="parsed")
    b <- t(sapply(a$items, function(d) c(id = d$id, name = d$name)))
    b <- as.table(b)
    rownames(b) <- NULL
    b
}
