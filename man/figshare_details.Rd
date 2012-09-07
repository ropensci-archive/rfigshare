\name{figshare_details}
\alias{figshare_details}
\title{Get details for an article}
\usage{
  figshare_details(article_id, session = fs_get_auth(),
    show_versions = FALSE, version = NULL)
}
\arguments{
  \item{article_id}{number}

  \item{session}{the authentication credentials from
  \code{\link{figshare_auth}}}

  \item{show_versions}{logical, show what versions are
  available}

  \item{version}{show a given version number}
}
\description{
  Get details for an article
}
\examples{
\dontrun{
figshare_auth()
figshare_details("138")
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

