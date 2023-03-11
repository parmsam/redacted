test_that("redact_all function works", {
  text <- "My phone number is 555-123-4567 and my email is john@example.com"
  expected_output <- "My phone number is [REDACTED] and my email is [REDACTED]"
  actual_output <- redact_all(text)
  expect_equal(actual_output, expected_output)

  expected_output <- "My phone number is [REDACTED] and my email is john@example.com"
  actual_output <- redact_all(
    text,
    redact_funcs = list(
      redacted::redact_phone_numbers,
      redacted::redact_ip_addresses
    )
  )
  expect_equal(actual_output, expected_output)
})

