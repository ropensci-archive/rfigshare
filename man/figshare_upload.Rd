\name{figshare_upload}
\alias{figshare_upload}
\title{Upload file to an article}
\usage{
  figshare_upload(file, article_id,
    session = fs_get_auth())
}
\arguments{
  \item{file}{path to file to upload}

  \item{article_id}{number}

  \item{session}{the authentication credentials from
  \code{\link{figshare_auth}} (optional)}
}
\description{
  Upload file to an article
}
\details{
  Article must be a draft, i.e. created by
  \code{\link{figshare_create}} and not yet made public or
  private
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

