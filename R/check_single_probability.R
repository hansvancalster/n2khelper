#' Check if the object is a single probability
#'
#' @param x the object to check
#' @param name the name of the object to use in the error message
#' @return The function gives the single probability back. it throws an error when the input is not a single probability.
#' @export
#' @examples
#' check_single_probability(0.5)
check_single_probability <- function(x, name = "x"){
  x <- check_single_numeric(x = x, name = name)
  if (x < 0) {
    stop(name, " must be positive")
  }
  if (x > 1) {
    stop(name, " must be smaller than 1")
  }
  return(x)
}
