
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

## Credits

- Hex icon created using the [hexmake
  app](https://connect.thinkr.fr/hexmake/) from
  [ColinFay](https://github.com/ColinFay/hexmake).
- <a href="https://www.flaticon.com/free-icons/highlighter" title="highlighter icons">Highlighter
  icons created by Smashicons - Flaticon</a>
