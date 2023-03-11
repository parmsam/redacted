test_that("redact_pattern function works", {
  text <- "The secret code is 12345"
  pattern <- "\\d{5}"
  expected_output <- "The secret code is [REDACTED]"
  actual_output <- redact_pattern(text, pattern)
  expect_equal(actual_output, expected_output)

  text <- "Contact me at john@example.com"
  expected_output <- "Contact me at [REDACTED]"
  actual_output <- redact_pattern(text, pattern = "\\S+@\\S+")
  expect_equal(actual_output, expected_output)
})
