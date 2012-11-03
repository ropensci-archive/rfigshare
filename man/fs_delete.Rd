\name{fs_delete}
\alias{fs_delete}
\title{Delete article (private or drafts only)}
\usage{
  fs_delete(article_id, session = fs_get_auth())
}
\arguments{
  \item{article_id}{the id number of the article}

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}. If not provided, will attempt
  to load from cache as long as figshare_auth has been
  run.}
}
\value{
  output of DELETE request (invisibly)
}
\description{
  Delete article (private or drafts only)
}
\examples{
\dontrun{
fs_delete(123)
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

