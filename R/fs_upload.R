#'  Upload file to an article 
#' 
#' @details Article must be a draft, i.e. created by \code{\link{fs_create}} and not yet made public or private. Only articles of type "fileset" can have multiple files uploaded.  
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id number
#' @param file path to file to upload
#' @param session the authentication credentials from \code{\link{fs_auth}} (optional)
#' @seealso \code{\link{fs_auth}}
#' @references \url{http://api.figshare.com}
#' @examples
#' \dontrun{
#' id <- fs_create("Title", "description", "figure")
#' fs_upload(id, "file.png")
#' } 
#' @export
fs_upload <- function(article_id, file, session = fs_get_auth()){
  base <- "http://api.figshare.com/v1"
  method <- paste("/my_data/articles", article_id, "files", sep= "/")
  request = paste(base, method, sep="")
  body = list(filedata = upload_file(file))
  config = c(verbose(), session, add_headers("Content-Type" = "multipart/form-data"))
  out <- PUT(request, config=config, body=body)
}
