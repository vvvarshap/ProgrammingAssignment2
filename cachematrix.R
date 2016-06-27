## Put comments here that give an overall description of what your
## functions do

#The first function, makeCacheMatrix creates special matrix(assumption: that it is always invertible), which is a list containing a function to
#set and get value of matrix and set and get the value of the inverse of the matrix. 
#The second function, cacheSolve, calcualtes the inverse of the matrix created with the makeCacheMatrix function.
#But it checks to see if the inverse has already been calculated. if it gets the inverse from the 
#cache and skips computation. Otherwise it calculates the inverse of the matrix and sets the value 
#of the inverse in the cache via the setinverse function. 


## Write a short comment describing this function

#This function creates a special "matrix" object that can cache its inverse. 
#makeCacheMatrix has embedded functions namely:
# get - which returns the matrix x stored in the main function.
# set - which changes the vector stored in the main function.
# setinverse and getinverse calculate the inverse and store the value of the input in a variable m
# in the function makeVector (setinverse) and return it (getinverse).

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
#This function creates the inverse of the matrix created with the makeCachematrix.
#It first part of the function chceks to see if the inverse has already been calculated and 
#and if function can get inverse from cache and skip computation.
# the second part of the function data gets stored with makeCacheMatrix, m calculates inverse 
#and x$setinverse(m) stores it in object m in makeCacheMatrix and sets the value of the inverse
#in the cache via the setinverse function.

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

#Trialof function -Worked! 
x<- matrix(c(2,3,4,5,6,7,8,9,10), nrow=3,ncol=3)

CachedMatrix <- makeCacheMatrix(x)
cacheSolve(CachedMatrix)

