
#' Get details for an article
#'
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id number
#' @param session the authentication credentials from \code{\link{fs_auth}}
#' @param show_versions logical, show what versions are available
#' @param version show a given version number
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com}
#' @import httr
#' @export
#' @examples \dontrun{
#' fs_details(138)
#' }
fs_details <- 
  function(article_id, session = fs_get_auth(),
         show_versions=FALSE, version=NULL){
    base <- "http://api.figshare.com/v1"
    method <- paste("my_data/articles", article_id, sep="/")
    if(show_versions)
      method <- paste(method, "versions", sep="/")
    if(!is.null(version))
      method <- paste(method, version, sep="/")
    request = paste(base, method, sep="/")
    out <- GET(request, session)
    ## TODO: add class for info and pretty print summary 
    parsed_out <- parsed_content(out)
    output <- parsed_out$items[[1]]
    class(output) <- "fs_object"
    output
  }

#' Collect metadata from details call
#'
#' @author Edmund Hart \email{edmund.m.hart@@gmail.com}
#' @param fs_details_obj object
#' @references \url{http://api.figshare.com}
#' @export
#' @examples \dontrun{
#' fs_auth()
#' my_article <- fs_details("138")
#' summary_fs_details(my_article)
#' }
summary_fs_details <- function(fs_details_obj){
  fs_details_vec <- unlist(fs_details_obj)
  fs_summary <- split(fs_details_vec,names(fs_details_vec))
   ### We can change these keys to print what we think is most salient
  print_keys <- c("article_id","defined_type","doi","title","description","shares","views","downloads","owner.full_name","authors.full_name","tags.name","categories.name","files.name","links.link")
  print_names <- c("Article ID", "Article type","DOI","Title","Description","Shares","Views","Downloads","Owner","Authors","Tags","Categories","File names","Links")
  
  for(i in 1:length(print_keys)){
    cat(print_names[i],":",paste(unname(fs_summary[[print_keys[i]]]),sep="",collapse=", "))
    cat("\n")
  }
  
}



