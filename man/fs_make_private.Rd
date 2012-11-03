\name{fs_make_private}
\alias{fs_make_private}
\title{Make an article private (draft only?)}
\usage{
  fs_make_private(article_id, session = fs_get_auth())
}
\arguments{
  \item{article_id}{the id number of the article}

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}. If not provided, will attempt
  to load from cache as long as \code{\link{fs_auth}} has
  been run.}
}
\value{
  output of PUT request (invisibly)
}
\description{
  Make an article private (draft only?)
}
\examples{
\dontrun{
fs_make_private(123)
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

