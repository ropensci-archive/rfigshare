context("metadata")

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
