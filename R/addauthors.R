#' Add authors to article

HTTP method PUT
PATH  /my_data/articles/{article_id}/authors
Parameters  author_id
Content-type  application/json

figshare_addauthors <- function(author_id, article_id, session){
  base <- "http://api.figshare.com/v1/"
  method <- paste("/my_data/articles", article_id, "authors", sep= "/")
  request = paste(base, method, sep="")
  body <- toJSON(list("author_id"=author_id, "Content-Type" = "application/json"))
  out <- PUT(request, config=session, body=body)
}

