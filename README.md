
<!-- README.md is generated from README.Rmd. Please edit that file -->

# redacted <img src="man/figures/logo.png" align="right" height="139" />

<!-- badges: start -->
<!-- badges: end -->

The goal of redacted is to more easily redact sensitive data in strings.
The package provides a set of utility functions for masking sensitive
information in text data. This includes functions for redacting credit
card numbers, phone numbers, and other sensitive information using
regular expressions, as well as a utility function for general masking.

## Installation

You can install the development version of redacted from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("parmsam/redacted")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(redacted)

## basic example code
text <- "My IP address is 192.168.0.1. Please don't share it with anyone."
redacted_text <- redact_ip_addresses(text)
cat(redacted_text)
#> My IP address is [REDACTED]. Please don't share it with anyone.

text <- "Hello, my email address is john.doe@gmail.com. Please don't share it with anyone."
redacted_text <- redact_email_addresses(text)
cat(redacted_text)
#> Hello, my email address is [REDACTED]. Please don't share it with anyone.
```

It will also redact multiple instances of the sensitive information in
the string

``` r
text <- "My PIN is 1234. Your PIN is 4321."
redacted_text <- redact_pins(text)
cat(redacted_text)
#> My PIN is [REDACTED]. Your PIN is [REDACTED].
```

Or replace with a custom string using the `replace_with` option

``` r
text <- "My PIN is 1234. Your PIN is 4321."
redact_pins(text, replace_with = "[PIN REDACTED]")
#> [1] "My PIN is [PIN REDACTED]. Your PIN is [PIN REDACTED]."
cat(redacted_text)
#> My PIN is [REDACTED]. Your PIN is [REDACTED].
```

When you pass a single character such as \* to replace_with, the matched
string will be replaced with asterisks of the same length as the matched
string

``` r
text <- "My PIN is 1234. Your PIN is 4321."
redacted_text <- redact_pins(text, replace_with = "*")
cat(redacted_text)
#> My PIN is ****. Your PIN is ****.

text <- "My PIN is 1234. Your PIN is 4321."
redacted_text <- redact_pins(text, replace_with = "#")
cat(redacted_text)
#> My PIN is ####. Your PIN is ####.
```

You can also use the redact_pattern() function to redact any custom
pattern from text

``` r
# Redact email addresses from a string
text <- "Contact me at john@example.com"
redacted_text <- redact_pattern(text, pattern = "\\S+@\\S+")
cat(redacted_text)
#> Contact me at [REDACTED]
```

The `redact_all()` will attempt to redact using all of the underlying
`redact_*()` functions or a defined list of functions

``` r
text <- c("My phone number is 555-555-1234. My email is john@example.com")
redacted_text <- redact_all(text)
cat(redacted_text)
#> My phone number is [REDACTED]. My email is [REDACTED]
redacted_text <- redact_all(text, redact_funcs = list(redacted::redact_phone_numbers, redacted::redact_ip_addresses))
cat(redacted_text)
#> My phone number is [REDACTED]. My email is john@example.com
```

Note that the `redact_*()`functions are built using
`stringr::str_replace_all()` so you can use them on a vector of strings

``` r
text <- c("My PIN is 1234.", "Your PIN is 4321.", "Their PIN is 1111.")
redacted_text <- redact_pins(text)
cat(redacted_text)
#> My PIN is [REDACTED]. Your PIN is [REDACTED]. Their PIN is [REDACTED].
```

## Contributing

Contributions are welcome! Please open an issue to report a bug or
suggest a new feature, or submit a pull request to contribute code
changes.

## Credits

- Hex icon created using the [hexmake
  app](https://connect.thinkr.fr/hexmake/) from
  [ColinFay](https://github.com/ColinFay/hexmake).
- <a href="https://www.flaticon.com/free-icons/highlighter" title="highlighter icons">Highlighter
  icons created by Smashicons - Flaticon</a>
