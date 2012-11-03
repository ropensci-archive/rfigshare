\name{fs_add_categories}
\alias{fs_add_categories}
\title{Add a category to article}
\usage{
  fs_add_categories(article_id, category_id,
    session = fs_get_auth())
}
\arguments{
  \item{article_id}{the id number of the article}

  \item{category_id}{is a vector of integers corresponding
  to categories or a vector of category names}

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}. If not provided, will attempt
  to load from cache as long as figshare_auth has been
  run.}
}
\value{
  output of PUT request (invisibly)
}
\description{
  Add a category to article
}
\examples{
\dontrun{
fs_add_categories(138, "Ecology")
}
}
\author{
  Edmund Hart \email{edmund.m.hart@gmail.com}
}
\references{
  \url{http://api.figshare.com}
}
\seealso{
  \code{\link{fs_auth}}
}

