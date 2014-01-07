#' @import yaml
#' @S3method print fs_object
print.fs_object <- function(x, ...){
  cat(as.yaml(x))
# x
}

#' @import yaml
#' @S3method summary fs_object
summary.fs_object <- function(object, ...){
  cat(as.yaml(object))
# object
}


