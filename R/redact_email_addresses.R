#' Redact email addresses in text
#'
#' This function redacts email addresses in a given text by replacing them with a specified string.
#'
#' @param text The text in which email addresses are to be redacted.
#' @param replace_with A string to replace email addresses with.
#'   It can be either a whole word pattern or a single character.
#'   Default is NULL, which uses the default value specified in the
#'   `replace_pattern()` function.
#'
#' @return A character vector with redacted email addresses.
#' @export
#'
#' @examples
#' text <- "Hello, my email address is john.doe@gmail.com. Please don't share it with anyone."
#' redacted_text <- redact_email_addresses(text)
#' cat(redacted_text)
#'
#' @importFrom stringr str_replace_all
redact_email_addresses <- function(text, replace_with = NULL) {
    pattern <-
      "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}(?:\\.[A-Za-z]{2,})?\\b"
    redact_pattern(text, pattern, replace_with)
}
