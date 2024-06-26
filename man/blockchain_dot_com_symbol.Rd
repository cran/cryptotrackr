% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/blockchain_dot_com.R
\name{blockchain_dot_com_symbol}
\alias{blockchain_dot_com_symbol}
\title{blockchain_dot_com_symbol}
\usage{
blockchain_dot_com_symbol(symbol, timeout_seconds = 60)
}
\arguments{
\item{symbol}{the symbol for which to retrieve data}

\item{timeout_seconds}{seconds until the query times out. Default is 60.}
}
\value{
returns a list with various data for specified symbol
}
\description{
blockchain_dot_com_symbol
}
\examples{
symbol <- 'BTC-USD'
blockchain_dot_com_symbol(symbol, 4.5)
}
