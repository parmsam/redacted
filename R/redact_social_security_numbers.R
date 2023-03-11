#' Redact social security numbers in text
#'
#' This function redacts social security numbers in a given text by replacing them with a specified string.
#'
#' @param text The text in which social security numbers are to be redacted.
#' @param replace_with A string to replace the social security numbers with.
#'   It can either be a whole word like "[REDACTED]", or a single character like "*"
#'   that gets repeated based on how long the social security number detected is.
#'   Default is NULL, which uses the default value specified in the
#'   `replace_pattern()` function.
#'
#' @return A character vector with social security numbers redacted.
#' @export
#'
#' @examples
#' text <- "My social security number is 123-45-6789. Please don't share it with anyone."
#' redacted_text <- redact_social_security_numbers(text)
#' cat(redacted_text)
#'
#' @importFrom stringr str_replace_all
redact_social_security_numbers <- function(text,replace_with = NULL) {
  pattern <- "\\b\\d{3}-\\d{2}-\\d{4}\\b"
  redact_pattern(text, pattern, replace_with)
}
