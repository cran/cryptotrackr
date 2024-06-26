% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/amberdata.R
\name{amberdata_market_metrics}
\alias{amberdata_market_metrics}
\title{amberdata_market_metrics}
\usage{
amberdata_market_metrics(api_key, symbol, timeout_seconds = 60)
}
\arguments{
\item{api_key}{your Amberdata API key}

\item{symbol}{the asset symbol you wish to receive metrics for}

\item{timeout_seconds}{seconds until the query times out. Default is 60.}
}
\value{
returns a list containing market metrics for the specified symbol.
}
\description{
amberdata_market_metrics
}
\examples{
\dontrun{
api_key <- "..."
metrics <- amberdata_market_metrics(api_key, "btc")}
}
