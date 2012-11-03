\name{fs_browse}
\alias{fs_browse}
\title{Browse articles}
\usage{
  fs_browse(mine = FALSE, public_only = FALSE,
    private_only = FALSE, drafts_only = FALSE,
    session = fs_get_auth(),
    base = "http://api.figshare.com/v1", query = NA)
}
\arguments{
  \item{mine}{Logical, show only my (authenticated user's)
  articles. Defaults to FALSE, browse all public articles.}

  \item{public_only}{(for use with mine=TRUE only) browse
  only my public articles. default is FALSE}

  \item{private_only}{(for use with mine=TRUE only) browse
  only my private articles. default is FALSE}

  \item{drafts_only}{(for use with mine=TRUE only) browse
  only my draft articles. default is FALSE}

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}. If not provided, will attempt
  to load from cache as long as figshare_auth has been
  run.}

  \item{base}{the API access url}

  \item{query}{a search query tern (equivalent to calling
  fs_search)}
}
\value{
  output of PUT request (invisibly)
}
\description{
  Browse can be set to all public articles, the users own
  articles, Browse can filter on matching timestamp,
  author, title, description, tag, category, and date
  range.
}
\details{
  NOTE: CURRENTLY FILTERING IN BROWSE MODE IS NOT SUPPORTED
  BY THE API, other than mine, public, private, drafts_only
}
\examples{
\dontrun{
fs_browse(mine=TRUE)
}
}
\author{
  Carl Boettiger \email{cboettig@gmail.com}
}
\references{
  \url{http://api.figshare.com/docs/howto.html#q-search}
}
\seealso{
  \code{\link{fs_auth}}
}

