#' Redact domains in a text string
#'
#' This function searches a text string for domains and replaces them with a specified
#' value or the default value of "[REDACTED]".
#'
#' @param text A character string containing the text to be searched and redacted
#' @param replace_with A character string that specifies the value to replace the matched domains with. If
#' this argument is not specified, the default value of "[REDACTED]" will be used.
#'
#' @return A character string with matched domains replaced with the specified or default value
#'
#' @examples
#' text <- "Visit our website at www.example.com for more information."
#' redact_domains(text)
#'
#' @importFrom stringr str_replace_all
#' @importFrom stringr str_count
#'
#' @export
redact_domains <- function(text, replace_with = NULL) {
  pattern <- "\\b(?!www\\.)[A-Za-z0-9.-]+\\.[A-Za-z]{2,}(?::\\d{1,5})?\\b"
  redact_pattern(text, pattern, replace_with)
}
