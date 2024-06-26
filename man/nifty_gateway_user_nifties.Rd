% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nifty_gateway.R
\name{nifty_gateway_user_nifties}
\alias{nifty_gateway_user_nifties}
\title{nifty_gateway_user_nifties}
\usage{
nifty_gateway_user_nifties(
  username,
  limit = NULL,
  offset = NULL,
  contract_address = NULL,
  timeout_seconds = 60
)
}
\arguments{
\item{username}{the username you wish to query}

\item{limit}{optionally provide the maximum number of results to return. This
is a numeric parameter.}

\item{offset}{optionally specify how many results to skip. This is a numeric
parameter.}

\item{contract_address}{optionally filter results by contract address.}

\item{timeout_seconds}{seconds until the query times out. Default is 60.}
}
\value{
returns a dataframe containing information about the nifties owned by
the specified user
}
\description{
nifty_gateway_user_nifties
}
\examples{
\donttest{
nifties <- nifty_gateway_user_nifties('tommy')}
}
