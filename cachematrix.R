##Using functions to cache the result of a matrix inversion. These calculations
## can be very time-consumming and it grows to the n^3, where n is the size of
## the matrix.

##  cacheMatrix$set(M)      # Change the matrix being cached.
##  M <- cacheMatrix$get()  # Returns the matrix being cached.

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        cachedInverse <- NULL
        set <- function(y) {
                x <<- y
                cachedInverse <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) cachedInverse <<- inverse
        getInverse <- function() cachedInverse
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}

## Return the inverse of cachedMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invFunc <- x$getInverse()
        if(!is.null(invFunc)) {
                message("getting cached data")
                return(invFunc)
        }
        data <- x$get()
        invFunc <- solve(data, ...)
        x$setInverse(invFunc)
        invFunc
}