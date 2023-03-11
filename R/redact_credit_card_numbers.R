#' Redact credit card numbers in text
#'
#' This function redacts credit card numbers in a given text by replacing them
#'   with a specified string.
#'
#' @param text The text in which credit card numbers are to be redacted.
#' @param replace_with A string to replace the credit card numbers with.
#'   It can either be a whole word like "[REDACTED]", or a single character like "*"
#'   that gets repeated based on how long the credit card number detected is.
#'   Default is NULL, which uses the default value specified in the
#'   `replace_pattern()` function.
#'
#' @return A character vector with credit card numbers redacted.
#' @export
#'
#' @examples
#' text <- "My credit card number is 1234 5678 9012 3456. Please don't share it with anyone."
#' redacted_text <- redact_credit_card_numbers(text)
#' cat(redacted_text)
#'
#' @importFrom stringr str_replace_all
redact_credit_card_numbers <- function(text, replace_with = NULL) {
  pattern <- "\\b(?:\\d[ -]*?){13,16}\\b"
  redact_pattern(text, pattern, replace_with)
}
