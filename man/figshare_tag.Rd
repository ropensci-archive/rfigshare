\name{figshare_tag}
\alias{figshare_tag}
\title{Add tags to article}
\usage{
  figshare_tag(tag, article_id, session = fs_get_auth())
}
\arguments{
  \item{tag}{name of the tag to add}

  \item{article_id}{the id number of the article to create}

  \item{session}{the authentication credentials from
  \code{\link{figshare_auth}}}
}
\value{
  output of PUT request (invisibly)
}
\description{
  Add tags to article
}
\examples{
\dontrun{
 figshare_auth()
 figshare_tag("phylogenetics")
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

