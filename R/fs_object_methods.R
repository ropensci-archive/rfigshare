
#' @S3method print fs_object
print.fs_object <- function(x, ...){
  summary_fs_details(x)
}

#' @S3method summary fs_object
summary.fs_object <- function(object, ...){
  summary_fs_details(object)
}


