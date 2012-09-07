\name{figshare_author}
\alias{figshare_author}
\title{Add author to an article}
\usage{
  figshare_author(author_id, article_id,
    session = fs_get_auth())
}
\arguments{
  \item{author_id}{the id number of a registered figshare
  user (see figshare_search_authors)}

  \item{article_id}{id number of an article on figshare}

  \item{session}{(optional) the authentication credentials
  from \code{\link{figshare_auth}}. If not provided, will
  attempt to load from cache as long as figshare_auth has
  been run.}
}
\value{
  adds the requested author to the given article
}
\description{
  Add author to an article
}
\examples{
\dontrun{
 figshare_auth()
 figshare_authors("123", "456")
}
}
\author{
  Carl Boettiger \email{cboettig@gmail.com}
}

