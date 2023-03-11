#' Redact website URLs in a text string
#'
#' This function searches a text string for website URLs and replaces them with
#' a specified value or the default value of "[REDACTED]".
#'
#' @param text A character string containing the text to be searched and redacted
#' @param replace_with A character string that specifies the value to replace the
#' matched domains with. If this argument is not specified, the default value of
#' "[REDACTED]" will be used.
#'
#' @return A character string with matched domains replaced with the specified or default value
#'
#' @examples
#' text <- "Visit our website at www.example.com for more information."
#' redact_website_urls(text)
#'
#' @importFrom stringr str_replace_all
#' @export
redact_website_urls <- function(text, replace_with = NULL) {
  pattern <- "(https?://)?(www\\.)?[a-z0-9]+([\\-\\.]{1}[a-z0-9]+)*\\.[a-z]{2,5}(:[0-9]{1,5})?([/?#][^\\s]*)?"
  redact_pattern(text, pattern, replace_with)
}

