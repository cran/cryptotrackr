% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/crypto_dot_com.R
\name{crypto_dot_com_get_candlestick}
\alias{crypto_dot_com_get_candlestick}
\title{crypto_dot_com_get_candlestick}
\usage{
crypto_dot_com_get_candlestick(
  instrument,
  timeframe = "5m",
  timeout_seconds = 60
)
}
\arguments{
\item{instrument}{the instrument name which you want to query}

\item{timeframe}{the timeframe which each candle represents. You can choose
from the following options: '1m', '5m', '15m', '30m', '1h', '4h', '6h',
'12h', '1D', '7D', '14D', '1M'. The defailt option is '5m'.}

\item{timeout_seconds}{seconds until the query times out. Default is 60.}
}
\value{
returns a list which contains metadata about your query along with a
dataframe containing your candlestick data.
}
\description{
crypto_dot_com_get_candlestick
}
\examples{
crypto_dot_com_get_candlestick("BTC_USDT", timeout_seconds = 4.5)
}
