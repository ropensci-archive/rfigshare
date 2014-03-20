library(rfigshare)


context("Authentication, creating authors, and content")

test_that("We are able to create objects on figshare", {

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

	# Downloading a csv file
	url <- fs_download(90818)
	data <- read.csv(url)
	expect_that(data, is_a("data.frame"))

	#downloading an Excel file
	excel_url <- fs_download(894949)
	excel_data <- gdata::read.xls(excel_url)
	expect_that(excel_data, is_a("data.frame"))
})




# ----------------------------------------------------------------
context("Metadata to/from existing objects")



# fs_add_tags
# fs_update
test_that("We are able to add metadata to existing objects", {
	  data <- head(iris)
	  new_fs_obj <- fs_create("Dummy data", "Fisher's iris", "dataset")
# fs_add_authors	  
	  expect_that(fs_add_authors(new_fs_obj, "Scott Chamberlain"), shows_message("found ids for all authors"))
# fs_add_categories	  
# difficult to write detailed tests for functions that return invisible output. 
# only testing for bad calls. 	  
	  expect_error(fs_add_categories(new_fs_obj, ""))
# fs_add_links
# For now there is no test for add_links. See discussion at issue #63
expect_error(fs_add_tags(new_fs_obj))
# fs_update, again can't really test this.
# fs_update(new_fs_obj, title = "This is now the new title")
})

test_that("articles are tagged as 'Published using rfigshare'", {


 write.csv(mtcars, "mtcars.csv")
 id <- fs_new_article(title="A Test of rfigshare",
                         description="This is a test",
                         type="dataset",
                         authors=c("Karthik Ram", "Scott Chamberlain"),
                         tags=c("ecology", "openscience"),
                         categories="Ecology",
                         links="http://ropensci.org",
                         files="mtcars.csv",
                         visibility="private")

  details <- fs_details(id, mine = TRUE)

  expect_match("Published using rfigshare", sapply(details$tags, `[[`, "name")[[1]])

  fs_delete(id)
  unlink("mtcars.csv")
})

test_that("We can browse our own files", {
	expect_is(fs_browse(mine = TRUE), "list")
})

# ----------------------------------------------------------------
context("Searching figshare")
# fs_author_search
# fs_search
# fs_browse
# fs_category_list
test_that("We are able to perform search correctly", {
	  # fs_search
	  # skipping this for now because the search function is broken
	  # expect_is(fs_author_search("Karthik Ram"), "list")
	  

})


# ----------------------------------------------------------------
context("Manipulating objects on figshare")
# fs_make_public
# fs_make_private
# fs_delete (delete second)
test_that("We are able to change visibility of objects", {
	  data <- head(iris)
	  new_fs_obj <- fs_create("Dummy data", "Fisher's iris", "dataset")
	  write.csv(data, file = "iris_data.csv")
	  fs_upload(new_fs_obj, "iris_data.csv")
	  expect_that(fs_make_private(new_fs_obj), prints_text("error"))
	  fs_add_categories(new_fs_obj, "Ecology")
	  expect_that(fs_make_private(new_fs_obj), prints_text("success"))
	  fs_delete(new_fs_obj)
	  unlink("iris_data.csv")
})

test_that("We can make articles public", {
	  data <- head(iris)
	  new_fs_obj <- fs_create("Dummy data", "Fisher's iris", "dataset")
	  write.csv(data, file = "iris_data.csv")
	  fs_upload(new_fs_obj, "iris_data.csv")
	  expect_that(fs_make_public(new_fs_obj), prints_text("error"))
	  fs_add_categories(new_fs_obj, "Ecology")
	  expect_that(fs_make_public(new_fs_obj), prints_text("success"))
	  fs_delete(new_fs_obj)
	  unlink("iris_data.csv")

})
# ----------------------------------------------------------------
context("We can obtain summaries")
# plot_to_filename
# summary_fs_details
test_that("We can obtain summaries", {
#    fs_auth() # needs interactive environment
		my_article <- fs_details(138)
		summary_fs_details(my_article)
	  expect_that(summary_fs_details(my_article), prints_text("Article ID"))
	 

})


# ----------------------------------------------------------------
context("Testing miscellaneous functions")
test_that("We can save plots to disk while uploading", {
	  library(ggplot2)
	  p <- qplot(mpg, wt, data = mtcars)
	  plot_to_filename(p, "myfilename", ".")
	  expect_true(file.exists("myfilename.png"))
	  unlink("myfilename.png")

})


# miscellaneous functions
# fs_embed
# fs_ids
# Can't test because it's broken
# also missing tests for fs_embed

