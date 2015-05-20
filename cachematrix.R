## The two functions makeCacheMatrix and cacheSolve are written for Coursera r-programming class, assignment 2. These functions caclulate the inverse of a mean and cahce it, if the inverse is not already cached

## mackeCacheMatrix creates a special :matrix", which is really a list containing a function to set the value of a mtrix, get the value of a matrix, set the value of the inverse, get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setMatrix <- function(solve) m <<- solve
  getMatrix <- function() m
  list(set = set, get = get,
      setMatrix = setMatrix,
     getMatrix = getMatrix)
}


## The following function calculates the inverse of the special "matrix" created from makeCacheMatrix
cacheSolve <- function(x, ...) {
  m <- x$getMatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  matrix <- x$get()
  m <- solve(matrix, ...)
  x$setMatrix(m)
  m
        ## Return a matrix that is the inverse of 'x'
}