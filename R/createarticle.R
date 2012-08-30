# createarticle.R
# author: Carl Boettiger
# date: 28 June 2012

#' Create a FigShare article
#' @param title for the article
#' @param description of the article
#' @param type one of dataset, figure, media, poster, or paper
#' @import RJSONIO
#' @export
figshare_create <- 
function(title="test", description="description of test", type="dataset", session){
  require(RJSONIO)
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles")
  request <- paste(base, method, sep="/")
  meta <- toJSON(list("title"=title, "description"=description,
                      "type"=type))
  POST(request, config=session, body=meta, add_headers("Content-Type" = "application/json"))
}



