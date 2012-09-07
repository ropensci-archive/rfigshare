#'  Upload file to an article 
#' 
#' @details Article must be a draft, i.e. created by \code{\link{figshare_create}} and not yet made public or private
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id number
#' @param file path to file to upload
#' @param session the authentication credentials from \code{\link{figshare_auth}} (optional)
#' @seealso \code{\link{figshare_auth}}
#' @references \url{http://api.figshare.com}
#' @export
figshare_upload <- function(article_id, file, session = fs_get_auth()){
  base <- "http://api.figshare.com/v1/"
  method <- paste("/my_data/articles", article_id, "files", sep= "/")
  request = paste(base, method, sep="")
  body = list(y = upload_file(file))
  config = c(verbose(), session)
  out <- POST(request, config=config, body=body)
}
