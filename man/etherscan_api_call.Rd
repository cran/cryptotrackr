% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/etherscan.R
\name{etherscan_api_call}
\alias{etherscan_api_call}
\title{etherscan_api_call}
\usage{
etherscan_api_call(method, query)
}
\arguments{
\item{method}{"GET" or "POST"}

\item{query}{your query parameters}
}
\value{
returns data from your Etherscan API call
}
\description{
etherscan_api_call
}
\examples{
\dontrun{
address <- "0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae"
api_key <- "..."
tag <- "latest"
query_string <- list(
   module = 'account',
   action = 'balance',
   address = address,
   tag = tag,
   apikey = api_key
)

data <- etherscan_api_call('GET', query_string)}
}
