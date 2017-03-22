#' Upload file to an article
#'
#' @export
#'
#' @details Articles may be draft, private or public but all uploads are
#' saved as draft changes - the canonical public version of the deposit
#' is not updated. To update the public version of the repository, use
#' [fs_make_public()]. Only articles of type "fileset" can have
#' multiple files uploaded.
#'
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id an article id number or a character string (or list)
#' of numbers
#' @param file path to file to upload, or character string (or list) of files
#' (paths)
#' @param session the authentication credentials from [fs_auth()]
#' (optional)
#' @param ... curl options passed on to [httr::POST()]
#' @details If only a single id number is given but a character string of
#' files is given, then be sure that the id corresponds to an object of type
#' "fileset".  If article_id list has more than one id, then there must be a
#' corresponding file path for each id.
#' @seealso [fs_auth()]
#' @references https://docs.figshare.com/
#' @examples
#' \dontrun{
#' # set your auth token, see ?fs_auth for more info
#' # fs_auth("your token")
#'
#' id <- fs_create("Title", "description", "figure")
#' f <- system.file("examples", "file.png", package = "rfigshare")
#' fs_upload(id, f)
#' }
fs_upload <- function(article_id, file, session = fs_get_auth(), ...) {
  # handle lists by converting to expected type.
  if (inherits(article_id, "list")) {
    article_id <- as.character(article_id)
  }
  if (inherits(file, "list")) {
    file <- as.character(file)
  }

  if (length(article_id) == 1 && length(file) == 1) {
    fs_upload_one(article_id, file, session, ...)
  }
  if (length(article_id) > 1) {
    sapply(1:length(article_id), function(i) {
      fs_upload_one(article_id[i], file[i], session, ...)
    })
  }
  if (length(article_id) == 1 && length(file) > 1) {
    sapply(file, function(f) fs_upload_one(article_id, f, session, ...))
  }
}

#'  Upload file to an article
#'
#' @details Article must be a draft, i.e. created by \code{\link{fs_create}}
#' and not yet made public or private. Only articles of type "fileset" can
#' have multiple files uploaded.
#' @author Carl Boettiger \email{cboettig@@gmail.com}
#' @param article_id number
#' @param file path to file to upload
#' @param session the authentication credentials from \code{\link{fs_auth}}
#' (optional)
#' @seealso \code{\link{fs_auth}}
#' @references \url{https://docs.figshare.com/}
#' @keywords internal
#' @examples
#' \dontrun{
#' id <- fs_create("Title", "description", "figure")
#' fs_upload(id, "file.png")
#' }
fs_upload_one  <- function(article_id, file, session = fs_get_auth(), ...) {
  base <- "https://api.figshare.com/v2"
  res <- fs_upload_init(article_id, file, session, ...)

  request <- paste0(base,
                    sprintf("/account/articles/%s/files/%s", article_id,
                            res$file_id))
  body <- list(filedata = upload_file(file))
  config <- c(session, add_headers("Content-Type" = "multipart/form-data"))
  out <- httr::POST(request, config = config, body = body, ...)
  fs_tag_as_rfigshare(article_id)
  out
}

fs_upload_init <- function(article_id, file, session = fs_get_auth(), ...) {
  base <- "https://api.figshare.com/v2"
  request <- paste0(base, sprintf("/account/articles/%s/files", article_id))
  bytes <- file.info(file)$size
  md5 <- digest::digest(file, algo = "md5")
  body <- list(md5 = md5, name = basename(file), size = bytes)
  #config <- fs_get_auth(session)
  out <- httr::POST(request, session, body = body, encode = "json",
                    accept_json(), ...)
  tmp <- jsonlite::fromJSON(cont(out))
  c(tmp, file_id = as.numeric(strextract(tmp$location, "[0-9]+$")))
}
