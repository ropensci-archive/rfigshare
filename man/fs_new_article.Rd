\name{fs_new_article}
\alias{fs_new_article}
\title{Create a FigShare article.}
\usage{
  fs_new_article(title, description,
    type = c("dataset", "figure", "media", "poster", "paper", "fileset"),
    categories = NA, tags = NA, authors = NA, links = NA,
    files = NA,
    visibility = c("draft", "private", "public"),
    session = fs_get_auth(), verbose = FALSE)
}
\arguments{
  \item{title}{for the article}

  \item{description}{of the article}

  \item{type}{one of: dataset, figure, media, poster, or
  paper}

  \item{session}{the authentication credentials from
  \code{\link{fs_auth}}}

  \item{verbose}{print full post call return}

  \item{authors}{Orded list of authors for the article}
}
\value{
  article id
}
\description{
  fs_new_article is a wrapper around many other rfigshare
  commands to provide convenient posting.
}
\examples{
\dontrun{
fs_auth()
fs_
}
}
\references{
  \url{http://api.figshare.com}
}
\seealso{
  \code{\link{fs_auth}}
}

