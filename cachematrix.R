## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

###################################################################

set.seed(1472020)

#function makeCacheMatrix: Create a special "matrix" object that can cache its inverse (itsinv).
#X is a square invertible matrix, the matrix X is always invertible.
makeCacheMatrix <- function(x = matrix()) {
  itsinv <- NULL
  set <- function(y) {
    x <<- y
    itsinv <<- NULL
  }
  get <- function() x
  setitsinv <- function(inverse) itsinv <<- inverse
  getitsinv <- function() itsinv
  list(set = set, get = get, 
       setitsinv = setitsinv, 
       getitsinv = getitsinv)
}

#function cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
#cacheSolve return the inverse from the cache
cacheSolve <- function(x, ...) {
  itsinv <- x$getitsinv()
  if(!is.null(itsinv)) {
    message("getting cached result")
    return(itsinv)
  }
  data <- x$get()
  itsinv <- solve(data, ...)
  x$setitsinv(itsinv)
  itsinv
}

#checking my functions
#1. Create a squared matrix
mymatrix<-matrix(rnorm(36), 6, 6)
#2. apply makeCacheMatrix to my squared matrix (turning into a special matrix that can cache its inverse)
myCacheMatrix<-makeCacheMatrix(mymatrix)
#3. return the inverse
cacheSolve(myCacheMatrix)