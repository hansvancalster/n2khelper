% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auto_commit.R
\docType{methods}
\name{auto_commit}
\alias{auto_commit}
\alias{auto_commit,ANY,ANY-method}
\alias{auto_commit,gitConnection-methods}
\alias{auto_commit,ANY,gitConnection-method}
\alias{auto_commit,git_connection-methods}
\title{Commit staged changes in a git repository with automated message}
\usage{
auto_commit(package, connection, ...)

\S4method{auto_commit}{ANY,ANY}(package, connection, ...)

\S4method{auto_commit}{ANY,gitConnection}(package, connection, ...)
}
\arguments{
\item{package}{The name of the package from which we autocommit}

\item{connection}{The path of the repository. Default to \code{rawdata.path}}

\item{...}{parameters passed to \code{git_connection} when relevant}
}
\description{
The mesagge is based on the information returned by \code{\link[utils]{sessionInfo}}
}
