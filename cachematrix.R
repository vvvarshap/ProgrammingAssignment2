## Put comments here that give an overall description of what your
## functions do

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function

## Creating a function where the argument x is a matrix
makeCacheMatrix <- function(x = matrix()) {
##Assigning m value of NULL
m <- NULL
## Setting the value of the matrix
set <- function(y) {
##assigning value to x
x <<- y
##assigning value to y
m <<- NULL
 }

## getting the value of the matrix
get <- function() x
##setting the inverse of the matrix
setinverse <- function(solve) m <<- solve
##getting the inverse of the matrix
getinverse <- function() m
list(set = set, get = get,
setinverse = setinverse,
getinverse = getinverse)
}
## Write a short comment describing this function

cacheSolve <- function(x, ...) {
m <- x$getsolve()
if(!is.null(m)) {
message("getting cached data")
return (m)
}
data <- x$get()
m <- solve(data, ...)
x$setsolve(m)
m
}

x<- matrix(c(2,3,4,5,6,7,8,9,10), nrow=3,ncol=3)


CachedMatrix <- makeCacheMatrix(x)
cacheSolve(CachedMatrix)


