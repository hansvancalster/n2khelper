context("git_connection")

connection <- tempfile(pattern = "git2r-")
commit.user <- "me"
commit.email <- "me@me.com"

# test repo.path
expect_error(
  git_connection(
    repo.path = connection,
    commit.user = commit.user,
    commit.email = commit.email
  ),
  "is not a directory"
)
dir.create(connection)
expect_error(
  git_connection(
    repo.path = connection,
    commit.user = commit.user,
    commit.email = commit.email
  ),
  "is not a git repository"
)
repo <- git2r::init(connection)

#test commit.user
expect_error(
  git_connection(
    repo.path = connection,
    commit.user = 1,
    commit.email = commit.email
  ),
  "commit.user is not a string \\(a length one character vector\\)\\."
)
expect_error(
  git_connection(
    repo.path = connection,
    commit.user = NA,
    commit.email = commit.email
  ),
  "commit.user is not a string \\(a length one character vector\\)\\."
)
expect_error(
  git_connection(
    repo.path = connection,
    commit.user = rep(commit.user, 2),
    commit.email = commit.email
  ),
  "commit.user is not a string \\(a length one character vector\\)\\."
)

# test commit.email
expect_error(
  git_connection(
    repo.path = connection,
    commit.user = commit.user,
    commit.email = 1
  ),
  "commit.email is not a string \\(a length one character vector\\)\\."
)
expect_error(
  git_connection(
    repo.path = connection,
    commit.user = commit.user,
    commit.email = NA
  ),
  "commit.email is not a string \\(a length one character vector\\)\\."
)
expect_error(
  git_connection(
    repo.path = connection,
    commit.user = commit.user,
    commit.email = rep(commit.email, 2)
  ),
  "commit.email is not a string \\(a length one character vector\\)\\."
)

expect_is(
  git.connection <- git_connection(
    repo.path = connection,
    commit.user = commit.user,
    commit.email = commit.email
  ),
  "gitConnection"
)
expect_identical(
  git2r::config(repo)$local$user.name,
  commit.user
)
expect_identical(
  git2r::config(repo)$local$user.email,
  commit.email
)

expect_is(
  git_connection(
    repo.path = connection,
    username = "me",
    password = "junk",
    commit.user = commit.user,
    commit.email = commit.email
  ),
  "gitConnection"
)

expect_error(
  git_connection(
    repo.path = connection,
    username = rep("me", 2),
    password = "junk",
    commit.user = commit.user,
    commit.email = commit.email
  ),
  "username is not a string \\(a length one character vector\\)\\."
)
expect_error(
  git_connection(
    repo.path = connection,
    username = NA,
    password = "junk",
    commit.user = commit.user,
    commit.email = commit.email
  ),
  "username is not a string \\(a length one character vector\\)\\."
)
expect_error(
  git_connection(
    repo.path = connection,
    username = "",
    password = "junk",
    commit.user = commit.user,
    commit.email = commit.email
  ),
  "username not not equal to \"\""
)

expect_error(
  git_connection(
    repo.path = connection,
    username = "me",
    password = rep("junk", 2),
    commit.user = commit.user,
    commit.email = commit.email
  ),
  "password is not a string \\(a length one character vector\\)\\."
)
expect_error(
  git_connection(
    repo.path = connection,
    username = "me",
    password = NA,
    commit.user = commit.user,
    commit.email = commit.email
  ),
  "password is not a string \\(a length one character vector\\)\\."
)
expect_error(
  git_connection(
    repo.path = connection,
    username = "me",
    password = "",
    commit.user = commit.user,
    commit.email = commit.email
  ),
  "password not not equal to \"\""
)
