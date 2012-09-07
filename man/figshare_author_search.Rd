\name{figshare_author_search}
\alias{figshare_author_search}
\title{Search for an author}
\usage{
  figshare_author_search(author, session = fs_get_auth())
}
\arguments{
  \item{author}{a string to search for (name, can include
  spaces)}

  \item{session}{(optional) the authentication credentials
  from \code{\link{figshare_auth}}. If not provided, will
  attempt to load from cache as long as figshare_auth has
  been run.}
}
\value{
  output of PUT request (invisibly)
}
\description{
  Function to search for authors
}
\examples{
\dontrun{
figshare_auth()
figshare_author_search("Boettiger")
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

