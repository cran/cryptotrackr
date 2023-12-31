% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kucoin.R
\name{kucoin_subaccounts}
\alias{kucoin_subaccounts}
\title{kucoin_subaccounts}
\usage{
kucoin_subaccounts(api_key, api_secret, passphrase, version = "2")
}
\arguments{
\item{api_key}{your Kucoin API key.}

\item{api_secret}{your Kucoin API secret.}

\item{passphrase}{the passphrase you created when you created your Kucoin API
key.}

\item{version}{your API key version. This can be retrieved from your Kucoin
API console. The default value is "2".}
}
\value{
returns a list containing your Kucoin sub-accounts.
}
\description{
kucoin_subaccounts
}
\examples{
\dontrun{
api_key <- "..."
api_secret <- "..."
passphrase <- "..."
accounts <- kucoin_subaccounts(api_key, api_secret, passphrase)}
}
