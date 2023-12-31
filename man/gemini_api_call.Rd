% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gemini.R
\name{gemini_api_call}
\alias{gemini_api_call}
\title{gemini_api_call}
\usage{
gemini_api_call(key, secret, path, method)
}
\arguments{
\item{key}{your API key for Gemini}

\item{secret}{your secret key for Gemini}

\item{path}{your API endpoint}

\item{method}{"GET" or "POST"}
}
\value{
returns data from your Gemini API call
}
\description{
gemini_api_call
}
\examples{
\dontrun{
key <- "..."
secret <- "..."
path <- "/v1/mytrades"
method <- "POST"
data <- gemini_api_call(key, secret, path, method)}
}
