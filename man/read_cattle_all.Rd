% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_cattle_all.R
\name{read_cattle_all}
\alias{read_cattle_all}
\title{read_cattle_all}
\usage{
read_cattle_all(drop.zero = TRUE, add = TRUE)
}
\arguments{
\item{drop.zero}{remove the dataset that milk yeild == 0.}

\item{add}{add some columns for additional analysis.}

\item{path}{path to the xls/xlsx/csv/txt file.}
}
\description{
This import the multiple cattle data from http://www.aiak.or.kr. please locate the xls files in the working directory.
}
\examples{
read_cattle_all(drop.zero = TRUE)
read_cattle_all(drop.zero = FALSE, add = TRUE)
}
\keyword{cattle}
\keyword{dairy}
