#' kucoin_time
#'
#' @return returns a timestamp formatted in the way it is required in order to
#' make an API call to Kucoin.
#' @export
#'
#' @examples
#' kucoin_time()

kucoin_time <- function() {
  old <- options()
  on.exit(options(old))
  op <- options(digits.secs=0)
  tm <- as.POSIXlt(Sys.time(), "UTC")
  formatted_time <- round(as.numeric(as.POSIXct(tm))) * 1000
  return(as.character(formatted_time))
}

#' kucoin_signature
#'
#' @param api_secret your Kucoin API secret
#' @param time a timestamp string formatted the way Kucoin requires. This can be
#' created with the "kucoin_time" function.
#' @param method "GET" or "POST"
#' @param path the endpoint you are using to make an API call.
#' @param body needs to be a json string which matches url parameters. Use a
#' blank string if not applicable.
#'
#' @return returns a signature for use in you Kucoin API calls.
#' @export
#'
#' @examples
#' \dontrun{
#' api_secret <- "..."
#' time <- kucoin_time()
#' method <- "GET"
#' path <- "/api/v1/sub/user"
#' body <- ""
#' sig <- kucoin_signature(api_secret, time, method, path, body)}

kucoin_signature <- function(api_secret, time, method, path, body) {
  api_secret <- stringi::stri_enc_toutf8(api_secret)
  message <- paste(time, method, path, body, sep = '')
  sig <- digest::hmac(api_secret
                      , message
                      , "sha256"
                      , serialize = FALSE
                      , raw = TRUE
                      )
  encoded_sig <- openssl::base64_encode(sig)
  return(encoded_sig)
}

#' kucoin_api_call
#'
#' @param url the full url for your Kucoin API call
#' @param method "GET" or "POST"
#' @param api_key your Kucoin API key
#' @param sig signature for use in your Kucoin API call. This can be generated
#' with the "kucoin_signature" function.
#' @param time a timestamp string formatted the way Kucoin requires. This can be
#' created with the "kucoin_time" function.
#' @param passphrase the passphrase you created when you created your Kucoin API
#' key.
#' @param version your API key version. This can be retrieved from your Kucoin
#' API console.
#' @param api_secret your Kucoin API secret.
#' @param query a named list containing your query parameters.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns the data from your Kucoin API call.
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://api.kucoin.com/api/v1/sub/user"
#' api_key <- "..."
#' api_secret <- "..."
#' time <- kucoin_time()
#' method <- "GET"
#' path <- "/api/v1/sub/user"
#' body <- ""
#' sig <- kucoin_signature(api_secret, time, method, path, body)
#' passphrase <- "..."
#' version <- "2"
#'
#' accounts <- kucoin_api_call(url, method, api_key, sig, time, passphrase,
#' version, api_secret)}

kucoin_api_call <- function(url
                            , method
                            , api_key
                            , sig
                            , time
                            , passphrase
                            , version
                            , api_secret
                            , query = NULL
                            , timeout_seconds = 60){

  if (version == '2') {
    api_secret <- stringi::stri_enc_toutf8(api_secret)
    passphrase <- stringi::stri_enc_toutf8(passphrase)
    passphrase <- digest::hmac(api_secret
                               , passphrase
                               , "sha256"
                               , serialize = FALSE
                               , raw = TRUE)
    passphrase <- openssl::base64_encode(passphrase)
  }

  tryCatch({
    res <- httr::VERB(method
                      , url
                      , httr::accept("application/json")
                      , httr::add_headers('KC-API-KEY' = api_key
                                          , 'KC-API-SIGN' = sig
                                          , 'KC-API-TIMESTAMP' = time
                                          , 'KC-API-PASSPHRASE' = passphrase
                                          , 'KC-API-KEY-VERSION' = version
                      )
                      , httr::timeout(timeout_seconds)
                      , query = query
    )

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))
      return(data)
    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}

#' kucoin_subaccounts
#'
#' @param api_key your Kucoin API key.
#' @param api_secret your Kucoin API secret.
#' @param passphrase the passphrase you created when you created your Kucoin API
#' key.
#' @param version your API key version. This can be retrieved from your Kucoin
#' API console. The default value is "2".
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list containing your Kucoin sub-accounts.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' api_secret <- "..."
#' passphrase <- "..."
#' accounts <- kucoin_subaccounts(api_key, api_secret, passphrase)}

kucoin_subaccounts <- function(api_key, api_secret, passphrase, version = "2", timeout_seconds = 60){
  url <- "https://api.kucoin.com/api/v1/sub/user"
  time <- kucoin_time()
  method <- "GET"
  path <- "/api/v1/sub/user"
  body <- ""
  sig <- kucoin_signature(api_secret, time, method, path, body)

  data <- kucoin_api_call(url
                          , method
                          , api_key
                          , sig
                          , time
                          , passphrase
                          , version
                          , api_secret
                          , timeout_seconds = timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Kucoin API.")
    return(NULL)
  }

  if (!is.null(data$data)) {
    return(data$data)
  } else {
    warning("The response does not contain 'data'.")
    return(NULL)
  }
}

#' kucoin_accounts
#'
#' @param api_key your Kucoin API key.
#' @param api_secret your Kucoin API secret.
#' @param passphrase the passphrase you created when you created your Kucoin API
#' key.
#' @param version your API key version. This can be retrieved from your Kucoin
#' API console. The default value is "2".
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing your Kucoin accounts and balances.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' api_secret <- "..."
#' passphrase <- "..."
#' accounts <- kucoin_accounts(api_key, api_secret, passphrase)}

kucoin_accounts <- function(api_key
                            , api_secret
                            , passphrase
                            , version = '2'
                            , timeout_seconds = 60){
  url <- 'https://api.kucoin.com/api/v1/accounts'
  time <- kucoin_time()
  method <- 'GET'
  path <- '/api/v1/accounts'
  body <- ''
  sig <- kucoin_signature(api_secret, time, method, path, body)

  data <- kucoin_api_call(url
                          , method
                          , api_key
                          , sig
                          , time
                          , passphrase
                          , version
                          , api_secret
                          , timeout_seconds = timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Kucoin API.")
    return(NULL)
  }

  if (!is.null(data$data)) {
    return(data$data)
  } else {
    warning("The response does not contain 'data'.")
    return(NULL)
  }
}

#' kucoin_symbols_list
#'
#' @param market optionally provide a market to filter on. This function will
#' return all markets by default.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing information about trading symbols
#' @export
#'
#' @examples
#' kucoin_symbols_list('btc', 4.5)

kucoin_symbols_list <- function(market = NULL, timeout_seconds = 60){
  query <- list(market = toupper(market))

  tryCatch({
    res <- httr::VERB('GET'
                      , 'https://api.kucoin.com/api/v2/symbols'
                      , httr::accept("application/json")
                      , httr::timeout(timeout_seconds)
                      , query = query
    )

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))

      if (!is.null(data$data)) {
        return(data$data)
      } else {
        warning("The response does not contain 'data'.")
        return(NULL)
      }

    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}
