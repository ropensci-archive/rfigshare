\name{fs_search}
\alias{fs_search}
\title{Advanced Search}
\usage{
  fs_search(query = NA, author = NA, title = NA,
    description = NA, tag = NA, category = NA,
    from_date = NA, to_date = NA, mine = FALSE,
    public_only = FALSE, private_only = FALSE,
    drafts_only = FALSE, session = fs_get_auth(),
    base = "http://api.figshare.com/v1")
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

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}. If not provided, will attempt
  to load from cache as long as figshare_auth has been
  run.}
}
\value{
  output of PUT request (invisibly)
}
\description{
  Search function that will filter on matching timestamp,
  author, title, description, tag, category, and date
  range.  Query searches against matches in any metadata
  field.  Full-text searches coming soon.
}
\examples{
\dontrun{
fs_auth()
fs_search("Higgs", from_date="2012-04-01")
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

