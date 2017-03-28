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

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!class(x) %in% y) {
      stop(deparse(substitute(x)), " must be of class ",
           paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}

fs_base <- function() "https://api.figshare.com/v2"
