#' Redact sensitive patterns in text
#'
#' This function replaces sensitive patterns in a text with a specified replacement
#' string, or the default "[REDACTED]".
#'
#' @param text A character string containing the text to redact
#' @param pattern A character string specifying the regular expression pattern to search for
#' @param replace_with A character string specifying the replacement text to use. If NULL (default),
#' the sensitive pattern is replaced with "[REDACTED]".
#' @return A character string with sensitive patterns replaced with the specified replacement string
#' @examples
#' redact_pattern("My password is password123", "\\bpassword\\d*\\b")
#' redact_pattern("My API key is 1234-5678-9012-3456", "\\d{4}-\\d{4}-\\d{4}-\\d{4}", "[REDACTED]")
#' @export
redact_pattern <- function(text, pattern, replace_with = NULL) {
  if (is.null(replace_with)) {
    replace_pattern(text, pattern)
  } else {
    replace_pattern(text, pattern, replace_with)
  }
}

#' Replace pattern in text
#'
#' This function replaces a specified pattern in a given text with a specified string.
#'
#' @param text The text in which the pattern is to be replaced.
#' @param pattern The pattern to replace in the text.
#' @param replace_with A string to replace the pattern with.
#'
#' @return A character vector with the pattern replaced.
#'
#' @importFrom stringr str_replace_all
replace_pattern <- function(text, pattern, replace_with = "[REDACTED]") {
  redacted_text <- stringr::str_replace_all(text, pattern, function(match) {
    if (nchar(replace_with) == 1) {
      # If replace_with is a single character, repeat it n times, where n is the length of the matched pattern
      replace_with <- paste(rep(replace_with, nchar(match)), collapse = "")
    }
    return(replace_with)
  })
  return(redacted_text)
}
