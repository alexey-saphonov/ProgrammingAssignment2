## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # undefine solving function
  inv <- NULL
  # define getter and setter for the value
  set <- function(xupdate) {
    # set new input and cleanup cache
    x <<- xupdate
    inv <<- NULL
  }
  get <- function() {
    # get current input
    x
  }
  # define getter and setter for cache
  setsolve <- function(solve) {
    inv <<- solve
  }
  getsolve <- function() {
    inv
  }
  
  # return constructed object
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  # get solving function
  inv <- x$getsolve()
  if (!is.null(inv)) {
    # if it is not defined then return cache
    message("getting cached data")
    return(inv)
  }
  # otherwise perform the actual call over the data
  data <- x$get()
  inv <- solve(data, ...)
  x$setsolve(inv)
  inv
}