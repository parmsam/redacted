test_that("redact_pins function works", {
  text <- "My PIN is 1234"
  expected_output <- "My PIN is [REDACTED]"
  actual_output <- redact_pins(text)
  expect_equal(actual_output, expected_output)
})
