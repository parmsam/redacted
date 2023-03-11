#' Redact 4 digit pins from a string
#'
#' This function takes a string and replaces any occurrences of a 4 digit pin
#'
#' @param text A character string.
#' @param replace_with A character string to replace the matched pattern with.
#' If NULL, defaults to "[REDACTED]".
#' @return The input string with any 4 digit pins replaced with [REDACTED].
#' @export
#' @examples
#' redact_pins("My pin is 1234")
#' redact_pins("Her PIN is 9876")
#'
#' @importFrom stringr str_replace_all
redact_pins <- function(text, replace_with = NULL) {
  pattern <- "\\b\\d{4}\\b"
  redact_pattern(text, pattern, replace_with)
}
