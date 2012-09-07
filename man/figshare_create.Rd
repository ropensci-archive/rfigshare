\name{figshare_create}
\alias{figshare_create}
\title{Create a FigShare article (draft)}
\usage{
  figshare_create(title, description,
    type = c("dataset", "figure", "media", "poster", "paper"),
    session = fs_get_auth())
}
\arguments{
  \item{title}{for the article}

  \item{description}{of the article}

  \item{type}{one of: dataset, figure, media, poster, or
  paper}

  \item{session}{the authentication credentials from
  \code{\link{figshare_auth}}}
}
\value{
  output of post request (invisibly)
}
\description{
  Articles must be created with
  \code{\link{figshare_create}} with essential metadata.
  Then you can add files with
  \code{\link{figshare_upload}}, add categories, tags or
  authors with \code{\link{figshare_category}} or
  \code{\link{figshare_tag}} \code{\link{figshare_author}}.
  Authors not registered with a FigShare id can be created
  with \code{\link{figshare_create_author}}.  You can edit
  the original metadata with \code{\link{figshare_update}}.
  Finally, release the article as either private or public
  with \code{\link{figshare_private}} or
  \code{\link{figshare_public}}. Before creating the
  article, you must authenticate using
  \code{\link{figshare_auth}}.
}
\examples{
\dontrun{
sig <- figshare_auth()
figshare_create("My Title", "A description of the object", "dataset")
}
}
\references{
  \url{http://api.figshare.com}
}
\seealso{
  \code{\link{figshare_auth}}
}

