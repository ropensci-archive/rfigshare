figshare_article_details <- 
  function(id, session, show_versions=FALSE, version=NULL){
    base <- "http://api.figshare.com/v1"
    method <- paste("my_data/articles", id, sep="/")
    if(show_versions)
      method <- paste(method, "versions", sep="/")
    if(!is.null(version))
      method <- paste(method, version, sep="/")
    request = paste(base, method, sep="/")
    GET(request, session)
  }



