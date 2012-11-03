\name{fs_add_authors}
\alias{fs_add_authors}
\title{Add author to an article}
\usage{
  fs_add_authors(article_id, authors,
    session = fs_get_auth(), create_missing = FALSE)
}
\arguments{
  \item{article_id}{id number of an article on figshare}

  \item{authors}{a list/vector of authors (not a character
  string)}

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}. If not provided, will attempt
  to load from cache as long as figshare_auth has been
  run.}

  \item{create_missing}{(logical) Attempt to create authors
  not already registered on FigShare? (default is False and
  such authors will not be added).}
}
\value{
  adds the requested authors to the given article
}
\description{
  Add author to an article
}
\examples{
\dontrun{
 fs_add_authors("138", list("Scott Chamberlain", "Karthik Ram"))
}
}
\author{
  Carl Boettiger \email{cboettig@gmail.com}
}

