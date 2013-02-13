\name{fs_delete}
\alias{fs_delete}
\title{Delete article (private or drafts only) or attached file}
\usage{
  fs_delete(article_id, file_id = NULL,
    session = fs_get_auth())
}
\arguments{
  \item{article_id}{the id number of the article}

  \item{file_id}{the id number of the file, if removing an
  attached file from a fileset.  file_id defaults to NULL,
  removing the entire draft or private article.}

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}. If not provided, will attempt
  to load from cache as long as figshare_auth has been
  run.}
}
\value{
  output of DELETE request (invisibly)
}
\description{
  Delete article (private or drafts only) or attached file
}
\examples{
\dontrun{
fs_delete(123)

## Delete all attachments in the second-most-recent entry in my library
my_lib <- fs_browse(mine=TRUE)
article_id <- my_lib[[2]]$article_id
file_ids <- sapply(my_lib[[2]]$files, `[[`, "id")
sapply(file_ids, function(id) fs_delete(article_id, id))
}
}
\author{
  Carl Boettiger \email{cboettig@gmail.com}
}
\references{
  \url{http://api.figshare.com}
}
\seealso{
  \code{\link{fs_auth}}
}

