\name{fs_add_link}
\alias{fs_add_link}
\title{Add a link to article}
\usage{
  fs_add_link(article_id, link, session = fs_get_auth())
}
\arguments{
  \item{link}{the url you wish to add}

  \item{article_id}{the id number of the article}

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}. If not provided, will attempt
  to load from cache as long as authentication has been
  run.}
}
\value{
  output of PUT request (invisibly)
}
\description{
  Adds a url link to the metadata of an article
}
\examples{
\dontrun{
fs_auth()
fs_add_link(138, "http://carlboettiger.info")
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

