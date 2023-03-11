test_that("redact_social_security_numbers function works", {
  text <- "My social security number is 123-45-6789"
  expected_output <- "My social security number is [REDACTED]"
  actual_output <- redact_social_security_numbers(text)
  expect_equal(actual_output, expected_output)
})
