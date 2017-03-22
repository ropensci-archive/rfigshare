#' List all categories
#'
#' @export
#' @return a table of all the categories
#' @references http://api.figshare.com
#' @param debug enable debugging
#' @examples \dontrun{
#' fs_categories_list()
#' }
fs_category_list <- function(debug = FALSE){
    response <- GET("http://api.figshare.com/v1/categories")
    if(debug | response$status_code != 200)
      response
    else{
      a <- jsonlite::fromJSON(cont(response))
      b <- t(sapply(a$items, function(d) c(id = d$id, name = d$name)))
      b <- as.table(b)
      rownames(b) <- NULL
      b
    }
}
