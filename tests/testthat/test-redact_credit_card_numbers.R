test_that("redact_credit_card_numbers function works", {
  text <- "My credit card number is 1234-5678-9012-3456"
  expected_output <- "My credit card number is [REDACTED]"
  actual_output <- redact_credit_card_numbers(text)
  expect_equal(actual_output, expected_output)
})
