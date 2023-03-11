#' Redact sensitive information from a vector of strings
#'
#' This function redacts sensitive information, such as email addresses, phone numbers,
#' IP addresses, and domains, from a vector of strings. It uses the `redact_*`
#' family of functions to perform the redaction.
#'
#' @param text A character vector of text to be redacted.
#' @param redact_funcs A list of redaction functions to be applied to the text.
#'   Each function should take a character vector as input and return a character vector with
#'   the sensitive information redacted. Default is set to all of the currently defined
#'   `redact_*` functions.
#' @param replace_with A string to replace the sensitive information with.
#'   The default is "[REDACTED]".
#'
#' @return A character vector with the sensitive information redacted.
#'
#' @examples
#' text <- c("My phone number is 555-555-1234", "My email is john@example.com")
#' redact_all(text)
#' redact_all(text, redact_funcs = list(redacted::redact_phone_numbers, redacted::redact_ip_addresses))
#'
#' @export
redact_all <- function(
    text,
    redact_funcs = default_redact_functions(),
    replace_with = NULL) {
  if (!is.list(redact_funcs)) {
    stop("redact_funcs must be a list of `redact_*()` functions.")
  }
  redacted_text <- text
  for (func in redact_funcs) {
    redacted_text <- func(redacted_text, replace_with = replace_with)
  }
  redacted_text
}

#' Get a list of all redact functions in the package
#'
#' This function returns a character vector with the names of all redact functions
#' defined in the redacted package.
#'
#' @return A character vector with the names of all redact functions.
#' @export
#'
#' @examples
#' default_redact_functions()
#'
#' @keywords redact functions
#'
default_redact_functions <- function() {
  pattern_names <- ls("package:redacted", pattern = "^redact_")
  pattern_names <- setdiff(pattern_names, c("redact_all", "redact_pattern"))
  # ensure the redact domains is last
  pattern_names <- c(
    pattern_names[pattern_names != "redact_domains"],
    "redact_domains"
  )
  pattern_functions <- lapply(pattern_names, get)
  names(pattern_functions) <- pattern_names
  pattern_functions
}
