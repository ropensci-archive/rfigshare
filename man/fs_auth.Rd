\name{fs_auth}
\alias{fs_auth}
\title{Figshare authentication via OAuth1.0 using httr}
\usage{
fs_auth()
}
\value{
OAuth credential (invisibly).  The credential is also
written to the enivornment "FigshareAuthCache", which is
created when the package is loaded.  All functions needing
authentication can then access the credential without it
being explicitly passed in the function call.
}
\description{
Figshare authentication via OAuth1.0 using httr
}
\examples{
\dontrun{
fs_auth()
}
}
\author{
Carl Boettiger \email{cboettig@gmail.com}
}
\references{
\url{http://api.figshare.com}
}

