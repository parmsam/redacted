test_that("redact_email_addresses redacts email addresses", {
  text <- "My email address is john.doe@example.com"
  expected <- "My email address is [REDACTED]"
  result <- redact_email_addresses(text)
  expect_equal(result, expected)
})
