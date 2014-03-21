\name{fs_create}
\alias{fs_create}
\title{Create a FigShare article (draft)}
\usage{
fs_create(title, description, type = c("dataset", "figure", "media", "poster",
  "paper", "fileset"), session = fs_get_auth(), debug = FALSE)
}
\arguments{
  \item{title}{for the article}

  \item{description}{of the article}

  \item{type}{one of: dataset, figure, media, poster, paper
  or fileset. (Only filesets can have multiple uploaded
  files attached).}

  \item{session}{the authentication credentials from
  \code{\link{fs_auth}}}

  \item{debug}{print full post call return}
}
\value{
article id
}
\description{
Articles must be created with \code{\link{fs_create}} with
essential metadata.  Then you can add files with
\code{\link{fs_upload}}, add categories, tags or authors
with \code{\link{fs_add_categories}} or
\code{\link{fs_add_tags}} \code{\link{fs_add_authors}}.
Authors not registered with a FigShare id can be created
with \code{\link{fs_create_author}}.  You can edit the
original metadata with \code{\link{fs_update}}. Finally,
release the article as either private or public with
\code{\link{fs_make_private}} or
\code{\link{fs_make_public}}. Before creating the article,
you must authenticate using \code{\link{fs_auth}}.
}
\examples{
\dontrun{
fs_create("My Title", "A description of the object", "dataset")
}
}
\references{
\url{http://api.figshare.com}
}
\seealso{
\code{\link{fs_auth}}, \code{\link{fs_upload}}
}

