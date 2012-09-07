\name{fs_browse}
\alias{fs_browse}
\title{Browse articles}
\usage{
  fs_browse(author = NA, title = NA, description = NA,
    tag = NA, category = NA, from_date = NA, to_date = NA,
    mine = FALSE, public_only = FALSE,
    private_only = FALSE, drafts_only = FALSE,
    session = fs_get_auth())
}
\arguments{
  \item{mine}{Logical, show only my (authenticated user's)
  articles. Defaults to FALSE, browse all public articles.}

  \item{author}{Show only results by this author}

  \item{title}{Show only results matching or partially
  matching this title}

  \item{description}{Show only results matching or
  partially matching this description}

  \item{tag}{Show only results matching this tag}

  \item{category}{Show only results matching this category}

  \item{from_date}{Start time window for search. Date
  format is YYYY-MM-DD}

  \item{to_date}{Ending time window for search. Date format
  is YYYY-MM-DD}

  \item{mine}{Browse only articles owned by user. default
  is FALSE}

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
\examples{
\dontrun{
fs_auth()
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

