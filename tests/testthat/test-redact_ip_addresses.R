test_that("redact_ip_addresses() correctly redacts IP addresses", {
  text <- "The IP address is 192.168.0.1"
  expected <- "The IP address is [REDACTED]"
  result <- redact_ip_addresses(text)
  expect_equal(result, expected)

  text <- "This is an IP address: 192.168.0.1 and another one: 10.0.0.1."
  expected <- "This is an IP address: [REDACTED] and another one: [REDACTED]."
  output <- redact_ip_addresses(text)
  expect_equal(output, expected)
})
