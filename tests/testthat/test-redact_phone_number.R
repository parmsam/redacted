test_that("redact_phone_numbers redacts phone numbers", {
  text <- "My phone number is (123) 456-7890"
  expected <- "My phone number is [REDACTED]"
  result <- redact_phone_numbers(text)
  expect_equal(result, expected)
})
