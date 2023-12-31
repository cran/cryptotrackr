% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gemini.R
\name{gemini_trades}
\alias{gemini_trades}
\title{gemini_trades}
\usage{
gemini_trades(key, secret)
}
\arguments{
\item{key}{your API key for Gemini}

\item{secret}{your secret key for Gemini}
}
\value{
returns a dataframe containing all of your historical trades.
}
\description{
gemini_trades
}
\examples{
\dontrun{
key <- "..."
secret <- "..."
df <- gemini_trades(key, secret)}
}
