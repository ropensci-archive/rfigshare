\name{fs_new_article}
\alias{fs_new_article}
\title{Create a FigShare article.}
\usage{
  fs_new_article(title, description,
    type = c("dataset", "figure", "media", "poster", "paper", "fileset"),
    authors = NA, categories = NA, tags = NA, links = NA,
    files = NA,
    visibility = c("draft", "private", "public"),
    session = fs_get_auth())
}
\arguments{
  \item{title}{for the article, see \code{\link{fs_create}}
  for details.}

  \item{description}{of the article, see
  \code{\link{fs_create}} for details.}

  \item{type}{one of: dataset, figure, media, poster, or
  paper, see \code{\link{fs_create}} for details.}

  \item{authors}{Orded list of authors for the article, see
  \code{\link{fs_add_authors}} for details}

  \item{categories}{list of categories or category id
  numbers, see \code{\link{fs_add_categories}} for
  details.}

  \item{tags}{list of tags, see \code{\link{fs_add_tags}}
  for details.}

  \item{links}{list of links to add, see
  \code{\link{fs_add_links}} for details}

  \item{files}{path to the files to add, see
  \code{\link{fs_upload}} for details}

  \item{visibility}{one of "draft", "private" or "public".
  A draft document can still be edited and modified.  A
  public document is visible to everyone and cannot be
  deleted (though additional authors to the work can still
  "claim" their authorship).}

  \item{session}{(optional) credentials, see
  \code{link{fs_auth}}}
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
id <- fs_new_article(title="A Test of rfigshare",
                    description="This is a test of the fs_new_aricle function and related methods",
                    type="figure",
                    authors=c("Karthik Ram", "Scott Chamberlain"),
                    tags=c("ecology", "openscience"),
                    categories="Ecology",
                    links="http://ropensci.org",
                    files="figure/rfigshare.png",
                    visibility="private")
}
}
\references{
  \url{http://api.figshare.com}
}
\seealso{
  \code{\link{fs_auth}}, \code{\link{fs_add_categories}},
  \code{\link{fs_add_authors}}, \code{\link{fs_add_tags}},
  \code{\link{fs_add_links}}
}

