\name{fs_embed}
\alias{fs_embed}
\title{Upload a figure to figshare and return the url}
\usage{
fs_embed(file)
}
\arguments{
  \item{file}{path to an image file}
}
\value{
a url to the image file
}
\description{
Upload a figure to figshare and return the url
}
\details{
use with opts_knit$set(upload.fn = fs_embed)
}

