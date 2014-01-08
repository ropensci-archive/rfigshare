
context("Authentication, creating authors, and content")

test_that("We are able to create objects on figshare", {
# Make sure we cannot authenticate with bad credentials	
	  expect_error(fs_auth(cKey = "a",
          cSecret = "b",
          token = "c",
          token_secret = "d"))
# fs_auth 
# Note: These keys are for the rOpenSciDemo account. All content gets wiped nightly.
# Please do not use these in production. Create new keys from your own account
	  fs_auth(cKey = "kCV1UF2V1Bjw01TybvzDCg",
          cSecret = "dGLFrnXeBjXi6qdsO6vwAg",
          token = "QsqBaOrTBI0wuotW7cTDwAgFvSV1bmNouEoqYdWoYbZAQsqBaOrTXI0wuotW7cTDwA",
          token_secret = "2gz16wL1Tszh4TY2z6opcQ")

# fs_create
	  new_object <- fs_create("My Title", "A description of the object", "dataset")
	  expect_is(new_object, "numeric")
	  fs_delete(new_object)	  
# fs_create_author
	  expect_error(fs_create_author()) # Can't create an empty author
})

# ------------------------------------------------------------------

context("Data Retrieval")

test_that("Downloads work correctly", {
  fs_auth(cKey = "kCV1UF2V1Bjw01TybvzDCg",
          cSecret = "dGLFrnXeBjXi6qdsO6vwAg",
          token = "QsqBaOrTBI0wuotW7cTDwAgFvSV1bmNouEoqYdWoYbZAQsqBaOrTXI0wuotW7cTDwA",
          token_secret = "2gz16wL1Tszh4TY2z6opcQ")

	# Downloading a csv file
	url <- fs_download(90818)
	data <- read.csv(url)
	expect_that(data, is_a("data.frame"))

	#downloading an Excel file
	excel_url <- fs_download(894949)
	excel_data <- gdata::read.xls(excel_url)
	expect_that(excel_data, is_a("data.frame"))
})



