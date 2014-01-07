
#' get image url
#' 
#' @param id a figshare article id number 
#' @return a url to the image file
#' @details this is currently an unstable hack of html parsing
#' @import XML httr
fs_image_url <- function(id) {
  a <- fs_details(id)
  b <- GET(a$doi)
  b_parsed <- content(b, as = "parsed", type="text/html")
  img_url <- unlist(xmlToList(b_parsed$children$html))
  imgs <- grep("\\.png", img_url)
  m <- grep("figshare.com/media", img_url[imgs])
  out <- img_url[imgs][m]
  out
}


#' Upload a figure to figshare and return the url
#' 
#' @param file path to an image file
#' @return a url to the image file
#' @details use with opts_knit$set(upload.fn = fs_embed)
#' @export
fs_embed <- function(file) {
  ## Read in title, and details from an environment?  from chunk? 
  title <- file 
  description <- "embedded file automatically uploaded to figshare from R"
  id <- fs_new_article(title, description, type = "figure", visibility = "public")
  fs_image_url(id)
}


