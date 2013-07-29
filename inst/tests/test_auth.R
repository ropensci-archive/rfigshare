context("authentication")

test_that("We can authenticate with dummy credentials", {

  fs_auth(cKey = getOption("TestFigshareKey"), 
          cSecret = getOption("TestFigsharePrivateKey"), 
          token = getOption("TestFigshareToken"), 
          token_secret = getOption("TestFigsharePrivateToken"))

  id <- fs_create("Test Title", "Test Description", "dataset")
  expect_is(id, "numeric")

  fs_delete(id)
})
