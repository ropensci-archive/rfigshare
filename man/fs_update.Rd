\name{fs_update}
\alias{fs_update}
\title{Update article title, description, or type}
\usage{
fs_update(article_id, title = NA, description = NA, type = NA,
  mine = TRUE, session = fs_get_auth(), debug = FALSE)
}
\arguments{
  \item{article_id}{the id number of the article}

  \item{title}{for the article (to replace original title)}

  \item{mine}{Set to \code{TRUE} if it refers to an item on
  your own account}

  \item{description}{of the article (replaces original
  designation)}

  \item{type}{one of: dataset, figure, media, poster, or
  paper (replaces original designation)}

  \item{session}{(optional) the authentication credentials
  from \code{\link{fs_auth}}.}

  \item{debug}{return httr PUT request visibly?}
}
\value{
output of PUT request (invisibly)
}
\description{
Updates the article title, description or type. If any is
not specified, it will remain unchanged.
}
\details{
Updates the title, description, and type of an article.
}
\examples{
\dontrun{
fs_update(138, title = "New title")
}
}
\author{
Carl Boettiger \email{cboettig@gmail.com}
}
\references{
\url{http://api.figshare.com}
}
\seealso{
\code{\link{fs_auth}}, \code{\link{fs_add_tags}}
}

