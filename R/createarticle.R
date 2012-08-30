# createarticle.R
# author: Carl Boettiger
# date: 28 June 2012

figshare_create <- 
function(title="test", description="description of test", type="dataset", session){
  require(RJSONIO)
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles")
  request <- paste(base, method, sep="/")
  meta <- toJSON(list("title"=title, "description"=description,
                      "type"=type, "Content-Type" = "application/json"))
  POST(request, config=session, body=meta)
}



