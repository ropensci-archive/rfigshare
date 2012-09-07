\name{figshare_create_author}
\alias{figshare_create_author}
\title{Creates a figshare author}
\usage{
  figshare_create_author(full_name,
    session = fs_get_auth())
}
\arguments{
  \item{full_name}{full name of the author to create}

  \item{session}{(optional) the authentication credentials
  from \code{\link{figshare_auth}}. If not provided, will
  attempt to load from cache as long as figshare_auth has
  been run.}
}
\value{
  output of PUT request (invisibly)
}
\description{
  Creates a figshare author
}
\examples{
\dontrun{
sig <- figshare_auth()
figshare_create_author("Benjamin Franklin")
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

