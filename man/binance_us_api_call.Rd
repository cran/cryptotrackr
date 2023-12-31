% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binance_us.R
\name{binance_us_api_call}
\alias{binance_us_api_call}
\title{binance_us_api_call}
\usage{
binance_us_api_call(url, key, data, secret)
}
\arguments{
\item{url}{the base url and endpoint followed by '?' for your API call}

\item{key}{your Binance.US API key}

\item{data}{your URL encoded query parameters}

\item{secret}{your Binance.US secret key}
}
\value{
executes an authenticated API call
}
\description{
binance_us_api_call
}
\examples{
\dontrun{
key <- "..."
secret <- "..."
time <- binance_us_time()
data <- paste('timestamp=', time, sep = '')
url <- 'https://api.binance.us/api/v3/account'
data <- binance_us_api_call(url, key, data, secret)}
}
