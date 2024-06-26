% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/coinmarketcap.R
\name{coinmarketcap_airdrop}
\alias{coinmarketcap_airdrop}
\title{coinmarketcap_airdrop}
\usage{
coinmarketcap_airdrop(api_key, id, timeout_seconds = 60)
}
\arguments{
\item{api_key}{your CoinMarketCap API key}

\item{id}{the unique airdrop id which can be found through the airdrops api.}

\item{timeout_seconds}{seconds until the query times out. Default is 60.}
}
\value{
returns information about the airdrop for the id you provided.
}
\description{
coinmarketcap_airdrop
}
\examples{
\dontrun{
api_key <- "..."
id <- "10744"
airdrop <- coinmarketcap_airdrop(api_key, id)}
}
