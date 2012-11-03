\name{fs_upload}
\alias{fs_upload}
\title{Upload file to an article}
\usage{
  fs_upload(article_id, file, session = fs_get_auth())
}
\arguments{
  \item{article_id}{number}

  \item{file}{path to file to upload}

  \item{session}{the authentication credentials from
  \code{\link{fs_auth}} (optional)}
}
\description{
  Upload file to an article
}
\details{
  Article must be a draft, i.e. created by
  \code{\link{fs_create}} and not yet made public or
  private. Only articles of type "fileset" can have
  multiple files uploaded.
}
\examples{
\dontrun{
id <- fs_create("Title", "description", "figure")
fs_upload(id, "file.png")
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

