\name{figshare_public}
\alias{figshare_public}
\title{Make an article public (for private or draft articles)}
\usage{
  figshare_public(article_id, session = fs_get_auth())
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
  Make an article public (for private or draft articles)
}
\details{
  NOTE: Public articles are assigned DOIs and cannot be
  deleted or made private once declared public! Public
  articles do not count against your quota space.
}
\examples{
\dontrun{
sig <- figshare_auth()
figshare_public(123)
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

