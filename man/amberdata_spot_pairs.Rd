% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/amberdata.R
\name{amberdata_spot_pairs}
\alias{amberdata_spot_pairs}
\title{amberdata_spot_pairs}
\usage{
amberdata_spot_pairs(
  api_key,
  exchange = NULL,
  pair = NULL,
  include_dates = "false",
  time_format = "ms",
  timeout_seconds = 60
)
}
\arguments{
\item{api_key}{your Amberdata API key}

\item{exchange}{choose a specific exchange or multiple exchanges
(comma-separated) rather than all exchanges}

\item{pair}{choose a specific pair or multiple pairs (comma-separated) rather
than all pairs}

\item{include_dates}{include a start date and an end date along with your
data. Default is "false"}

\item{time_format}{the format to return your times in. Choose from:
"milliseconds", "ms", "iso", "iso8601", "hr", and "human_readable". Default
is "ms".}

\item{timeout_seconds}{seconds until the query times out. Default is 60.}
}
\value{
returns a list of spot pairs and exchanges supported on Amberdata
with the option of including the dates each one was supported.
}
\description{
amberdata_spot_pairs
}
\examples{
\dontrun{
api_key <- "..."
pairs <- amberdata_spot_pairs(api_key)
btc_usd <- amberdata_spot_pairs(api_key, pair = "btc_usd")}
}
