\name{figshare_private}
\alias{figshare_private}
\title{Make an article private (draft only?)}
\usage{
  figshare_private(article_id, session = fs_get_auth())
}
\arguments{
  \item{article_id}{the id number of the article}

  \item{session}{(optional) the authentication credentials
  from \code{\link{figshare_auth}}. If not provided, will
  attempt to load from cache as long as figshare_auth has
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
figshare_auth()
figshare_private(123)
}
}
\author{
  Carl Boettiger \email{cboettig@gmail.com}
}
\references{
  \url{http://api.figshare.com}
}
\seealso{
  \code{\link{figshare_auth}}
}

