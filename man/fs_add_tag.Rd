\name{fs_add_tag}
\alias{fs_add_tag}
\title{Add tags to article}
\usage{
  fs_add_tag(article_id, tag, session = fs_get_auth())
}
\arguments{
  \item{article_id}{the id number of the article to create}

  \item{tag}{name of the tag to add}

  \item{session}{the authentication credentials from
  \code{\link{fs_auth}}}
}
\value{
  output of PUT request (invisibly)
}
\description{
  Add tags to article
}
\examples{
\dontrun{
 fs_auth()
 fs_add_tag(138, "phylogenetics")
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

