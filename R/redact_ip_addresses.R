#' Redact IP addresses in text
#'
#' This function redacts IP addresses in a given text by replacing them with a specified string.
#'
#' @param text The text in which IP addresses are to be redacted.
#' @param replace_with A string to replace IP addresses with.
#'   It can be either a whole word pattern or a single character.
#'   Default is NULL, which uses the default value specified in the
#'   `replace_pattern()` function.
#'
#' @return A character vector with redacted IP addresses.
#' @export
#'
#' @examples
#' text <- "My IP address is 192.168.0.1. Please don't share it with anyone."
#' redacted_text <- redact_ip_addresses(text)
#' cat(redacted_text)
#'
#' @importFrom stringr str_replace_all
redact_ip_addresses <- function(text, replace_with = NULL) {
  pattern <- "\\b(?:\\d{1,3}\\.){3}\\d{1,3}\\b"
  redact_pattern(text, pattern, replace_with)
}
