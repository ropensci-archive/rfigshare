FigshareAuthCache <- new.env(hash=TRUE)

strextract <- function(str, pattern) {
  regmatches(str, regexpr(pattern, str))
}

cont <- function(x) {
  httr::content(x, "text", encoding = "UTF-8")
}

comp <- function(x) {
  Filter(Negate(is.null), x)
}
