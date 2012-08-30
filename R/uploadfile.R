# Upload file to article


figshare_upload <- function(files, article_id, session){
  base <- "http://api.figshare.com/v1/"
  method <- paste("/my_data/articles", article_id, "files", sep= "/")
  request = paste(base, method, sep="")
  out <- PUT(request, config=session)
}
