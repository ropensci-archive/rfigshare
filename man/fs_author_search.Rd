\name{fs_author_search}
\alias{fs_author_search}
\title{Search for an author}
\usage{
  fs_author_search(author, session = fs_get_auth())
}
\arguments{
  \item{author}{a string to search for (name, can include
  spaces)}

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}. If not provided, will attempt
  to load from cache as long as figshare_auth has been
  run.}
}
\value{
  output of PUT request (invisibly)
}
\description{
  Function to search for authors
}
\examples{
\dontrun{
fs_author_search("Boettiger")
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

