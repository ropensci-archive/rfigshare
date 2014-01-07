context("authentication")

test_that("We can authenticate with dummy credentials", {

  fs_auth(cKey = getOption("FigshareKey"), 
          cSecret = getOption("FigsharePrivateKey"), 
          token = getOption("FigshareToken"), 
          token_secret = getOption("FigsharePrivateToken"))

  id <- fs_create("Test Title", "Test Description", "dataset")
  expect_is(id, "numeric")

  fs_delete(id)
})
