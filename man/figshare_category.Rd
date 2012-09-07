\name{figshare_category}
\alias{figshare_category}
\title{Add category to article}
\usage{
  figshare_category(article_id, category_id,
    session = fs_get_auth())
}
\arguments{
  \item{article_id}{the id number of the article}

  \item{category_id}{Must be a category id number.  Support
  for actual category names coming soon.}

  \item{session}{(optional) the authentication credentials
  from \code{\link{figshare_auth}}. If not provided, will
  attempt to load from cache as long as figshare_auth has
  been run.}
}
\value{
  output of PUT request (invisibly)
}
\description{
  Add category to article
}
\examples{
\dontrun{
figshare_auth()
figshare_category(138, 10)
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

