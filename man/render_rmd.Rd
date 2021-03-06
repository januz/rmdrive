% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Rmd.R
\name{render_rmd}
\alias{render_rmd}
\title{Render Rmd file from GoogleDrive}
\usage{
render_rmd(file, gfile = basename(file), path = NULL,
  team_drive = NULL)
}
\arguments{
\item{file}{character. The name (without file extension) of a local \code{.Rmd}
file.}

\item{gfile}{character. The name of a Google Drive file (defaults to local
file name).}

\item{path}{character. (Sub)directory in My Drive or a Team Drive (optional).}

\item{team_drive}{character. The name of a Google Team Drive (optional).}
}
\description{
Renders Rmd file from GoogleDrive if there have been edits
}
