\name{fs_search}
\alias{fs_search}
\title{Advanced Search.}
\usage{
fs_search(query, author = NA, title = NA, description = NA, tag = NA,
  category = NA, from_date = NA, to_date = NA, mine = FALSE,
  public_only = FALSE, private_only = FALSE, drafts_only = FALSE,
  session = fs_get_auth(), base = "http://api.figshare.com/v1",
  debug = FALSE)
}
\arguments{
  \item{query}{the search query}

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
  is FALSE. Not functional. Use \code{\link{fs_browse}}
  instead.}

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

  \item{debug}{logical, enable debugging mode}
}
\value{
output of PUT request (invisibly)
}
\description{
Search function that will filter on matching timestamp,
author, title, description, tag, category, and date range.
Query searches against matches in any metadata field.
Full-text searches coming soon.
}
\examples{
\dontrun{
fs_search("Boettiger")
fs_search("Boettiger", author = "Carl")
fs_search("Boettiger", author = "Carl", from="2014-01-01")
fs_search("Boettiger", author = "Carl", from="2014-01-01",
          category = "Evolutionary Biology")

}
}
\author{
Carl Boettiger \email{cboettig@gmail.com}
}
\references{
\url{http://api.figshare.com/docs/howto.html#q-search}
}
\seealso{
\\code{\link{fs_auth}} \code{\link{fs_browse}}
}

