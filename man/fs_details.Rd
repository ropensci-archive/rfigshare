\name{fs_details}
\alias{fs_details}
\title{Get details for an article}
\usage{
  fs_details(article_id, session = fs_get_auth(),
    show_versions = FALSE, version = NULL)
}
\arguments{
  \item{article_id}{number}

  \item{session}{the authentication credentials from
  \code{\link{fs_auth}}}

  \item{show_versions}{logical, show what versions are
  available}

  \item{version}{show a given version number}
}
\description{
  Get details for an article
}
\examples{
\dontrun{
fs_details(138)
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

