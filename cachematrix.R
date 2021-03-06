

## Matrix inversion is usually a costly computation and their may be some benefit to caching,
## the inverse of a matrix rather than compute it repeatedly



##This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i<-NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inv) i <<-inv
  getinverse <- function() i 
  list(set = set,get=get,setinverse = setinverse,
       getinverse = getinverse)
  
}


##  This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
##  If the inverse has already been calculated (and the matrix has not changed),
##  then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached matrix")
    return(i)
  }
  mat <- x$get()
  i <- solve(mat, ...)
  x$setinverse(i)
  i
}
