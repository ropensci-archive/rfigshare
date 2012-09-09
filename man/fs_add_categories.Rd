\name{fs_add_categories}
\alias{fs_add_categories}
\title{Add categories to article}
\usage{
  fs_add_categories(article_id, categories,
    session = fs_get_auth())
}
\arguments{
  \item{article_id}{the id number of the article}

  \item{categories}{a list of categories.  Either the
  category names or numeric codes must be supplied, see
  \code{\link{fs_show_categories}})}

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}. If not provided, will attempt
  to load from cache as long as figshare_auth has been
  run.}
}
\value{
  output of PUT request (invisibly)
}
\description{
  Add categories to article
}
\examples{
\dontrun{
fs_auth()
fs_category(138, 10)
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

