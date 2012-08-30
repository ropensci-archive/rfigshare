figshare_makepublic <- function(id, session){
  base <- "http://api.figshare.com/v1"
  method <- paste("my_data/articles", id, "action/make_public", sep="/")
    request = paste(base, method, sep="/")
  POST(request, session)
}


