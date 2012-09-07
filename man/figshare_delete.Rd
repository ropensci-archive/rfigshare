\name{figshare_delete}
\alias{figshare_delete}
\title{Delete article (private or drafts only)}
\usage{
  figshare_delete(article_id, session = fs_get_auth())
}
\arguments{
  \item{article_id}{the id number of the article}

  \item{session}{(optional) the authentication credentials
  from \code{\link{figshare_auth}}. If not provided, will
  attempt to load from cache as long as figshare_auth has
  been run.}
}
\value{
  output of DELETE request (invisibly)
}
\description{
  Delete article (private or drafts only)
}
\examples{
\dontrun{
figshare_auth()
figshare_delete(123)
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

