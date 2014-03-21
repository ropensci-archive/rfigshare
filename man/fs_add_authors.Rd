\name{fs_add_authors}
\alias{fs_add_authors}
\title{Add author to an article}
\usage{
fs_add_authors(article_id, authors, session = fs_get_auth(),
  create_missing = TRUE, debug = FALSE)
}
\arguments{
  \item{article_id}{id number of an article on figshare}

  \item{authors}{a list or character string of authors or
  author id numbers (or mixed).}

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}. If not provided, will attempt
  to load from cache as long as figshare_auth has been
  run.}

  \item{create_missing}{(logical) Attempt to create authors
  not already registered on FigShare?}

  \item{debug}{return the httr result visibly?}
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
 fs_add_authors("138", c("Scott Chamberlain", "Karthik Ram"))
 fs_add_authors("138", list("Scott Chamberlain", "97306"))
 fs_add_authors("138", list("Scott Chamberlain", 97306))
 fs_add_authors(138, 97306)
}
}
\author{
Carl Boettiger \email{cboettig@gmail.com}
}

