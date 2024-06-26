% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/covalent.R
\name{covalent_portfolio}
\alias{covalent_portfolio}
\title{covalent_portfolio}
\usage{
covalent_portfolio(
  api_key,
  chain_id,
  address,
  csv = FALSE,
  timeout_seconds = 60
)
}
\arguments{
\item{api_key}{your Covalent API key}

\item{chain_id}{the string id of the chain for which you wish to check
portfolio history.}

\item{address}{the address you for which wish to get portfolio history.}

\item{csv}{'TRUE' will return csv data parsed as a dataframe while 'FALSE'
will return json data. The default value is 'FALSE'.}

\item{timeout_seconds}{seconds until the query times out. Default is 60.}
}
\value{
returns either a list or a dataframe with portfolio history
}
\description{
covalent_portfolio
}
\examples{
\dontrun{
api_key <- "..."
portfolio <- covalent_portfolio(api_key, "1", "trevorfrench.eth", csv = FALSE)}
}
