\name{fs_make_public}
\alias{fs_make_public}
\title{Make an article public (for private or draft articles)}
\usage{
  fs_make_public(article_id, session = fs_get_auth())
}
\arguments{
  \item{article_id}{the id number of the article}

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}.}
}
\value{
  output of PUT request (invisibly)
}
\description{
  Make an article public (for private or draft articles)
}
\details{
  NOTE: Public articles are assigned DOIs and cannot be
  deleted or made private once declared public! Public
  articles do not count against your quota space.
}
\examples{
\dontrun{
fs_make_public(123)
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

