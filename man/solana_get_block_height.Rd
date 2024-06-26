% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/solana.R
\name{solana_get_block_height}
\alias{solana_get_block_height}
\title{solana_get_block_height}
\usage{
solana_get_block_height(url, timeout_seconds = 60)
}
\arguments{
\item{url}{the RPC url for your API call}

\item{timeout_seconds}{seconds until the query times out. Default is 60.}
}
\value{
Returns the current block height of the node
}
\description{
solana_get_block_height
}
\examples{
\donttest{
url <- "https://api.devnet.solana.com"
data <- solana_get_block_height(url)}
}
