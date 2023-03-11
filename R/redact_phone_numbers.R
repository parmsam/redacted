#' Redact phone numbers in text
#'
#' This function redacts phone numbers in a given text by replacing them with a specified string.
#'
#' @param text The text in which phone numbers are to be redacted.
#' @param replace_with A string to replace the phone numbers with.
#'   It can either be a whole word like "[REDACTED]", or a single character like "*"
#'   that gets repeated based on how long the phone number detected is.
#'   Default is NULL, which uses the default value specified in the
#'   `replace_pattern()` function.
#'
#' @return A character vector with phone numbers redacted.
#' @export
#'
#' @examples
#' text <- "My phone number is (123) 456-7890. Please don't share it with anyone."
#' redacted_text <- redact_phone_numbers(text)
#' cat(redacted_text)
#'
#' @importFrom stringr str_replace_all
redact_phone_numbers <- function(text, replace_with = NULL) {
  pattern <- "\\b\\(?\\d{3}\\)?[ -]?\\d{3}[ -]?\\d{4}\\b"
  redact_pattern(text, pattern, replace_with)
}
