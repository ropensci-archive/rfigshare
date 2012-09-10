\name{fs_author_ids}
\alias{fs_author_ids}
\title{Get Author IDs from names}
\usage{
  fs_author_ids(authors, session = fs_get_auth(),
    graphics = FALSE)
}
\arguments{
  \item{authors}{a list/vector of authors (not a character
  string)}

  \item{graphics}{logical (default False) use graphic input
  to disambiguate?}

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}. If not provided, will attempt
  to load from cache.}
}
\value{
  a list of author id numbers, or NULLS where ids cannot be
  found.
}
\description{
  Take an author list, search for each author and return
  their FigShare ID. If no author is found, call
  fs_create_author and return the ID. If multiple matches
  are found, allow user to choose interactively
}
\keyword{internal}

