test_that("redact_website_urls redacts domain names", {
  text <- "Have you tried using https://www.google.com?"
  expected <- "Have you tried using [REDACTED]"
  result <- redact_website_urls(text)
  expect_equal(result, expected)
})
