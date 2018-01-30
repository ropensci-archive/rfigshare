
fs_tag_as_rfigshare <- function(article_id, session = fs_get_auth()) {
# Check if tagged yet
  o <- fs_details(article_id, mine=TRUE, session=session)
  tag <- "Published using rfigshare"
  m <- match(tag, sapply(o$tags, `[[`, "name"))
  out <- if(is.na(m))
    fs_add_tags(article_id, tag, session=session)
  invisible(out)
}
