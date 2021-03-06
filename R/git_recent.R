#' Get the info from the latest commit of a file
#' @inheritParams write_delim_git
#' @name git_recent
#' @rdname git_recent
#' @exportMethod git_recent
#' @docType methods
#' @importFrom methods setGeneric
#' @include git_connection.R
setGeneric(
  name = "git_recent",
  def = function(file, connection, ...){
    standard.generic("git_recent")
  }
)

#' @rdname git_recent
#' @aliases git_recent,git_connection-methods
#' @importFrom methods setMethod
setMethod(
  f = "git_recent",
  signature = signature(connection = "ANY"),
  definition = function(file, connection, ...){
    this.connection <- git_connection(repo.path = connection, ...)
    git_recent(file = file, connection = this.connection)
  }
)

#' @rdname git_recent
#' @aliases git_recent,git_connection-methods
#' @importFrom methods setMethod
setMethod(
  f = "git_recent",
  signature = signature(connection = "gitConnection"),
  definition = function(file, connection, ...){
    file <- check_single_character(x = file, name = "file")

    old.wd <- getwd()
    setwd(connection@Repository@path)
    commit.info <- system(
      paste0(
        "git log -n 1 --date=iso ",
        connection@LocalPath, "/", file
      ),
      intern = TRUE
    )
    setwd(old.wd)
    date <- commit.info[grep("^Date:", commit.info)]
    date <- as.POSIXct(date, format = "Date: %F %T %z")
    commit <- commit.info[grep("^commit", commit.info)]
    commit <- gsub("^commit ", "", commit)
    author <- commit.info[grep("^Author:", commit.info)]
    author <- gsub("^Author: ", "", author)
    return(list(
      Commit = commit,
      Author = author,
      Date = date
    ))
  }
)
