Skip to content
This repository  
Search
Pull requests
Issues
Gist
 @Culligan
 Unwatch 1
  Star 0
  Fork 84,025 Culligan/ProgrammingAssignment2
forked from rdpeng/ProgrammingAssignment2
 Code  Pull requests 0  Wiki  Pulse  Graphs  Settings
Branch: master Find file Copy pathProgrammingAssignment2/cachematrix.R
299281e  2 hours ago
@Culligan Culligan Update cachematrix.R
2 contributors @rdpeng @Culligan
RawBlameHistory     37 lines (33 sloc)  1.45 KB
## This function reads in a matrix or the arguments to make a matrix.
## It checks to see if the input is a matrix, and if not, makes a matrix.
## It then initializes the object mtxiv and the function set which assigns 
## variables to the parent environment.

makeCacheMatrix <- function(x = numeric(), nrows, ncols) {
    if (!is.matrix(x)) x <- matrix(x,nrows,ncols)
    mtxiv <- NULL
    set <- function(y) {
        x <<- y   ## assignment to the parent environment
        mtxiv <<- NULL ## initialize and assigns variable to hold matrix inverse to the parent environment
    }
    get <- function() x  ## sets up the function to retrieve the matrix from the local environment
    setinverse <- function(solve) mtxiv <<- solve
    getinverse <- function() mtxiv
    list(set = set, get = get, 
         setinverse = setinverse, 
         getinverse = getinverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix. 
## It checks to see if the inverse has  been calculated and not changed.
## If so, it then retrieves the inverse from the cache. If not, cacheSolve will compute 
## the inverse and store it in cache. 

cacheSolve <- function(x, ...) {
    mtxiv <- x$getinverse()
    if(!is.null(mtxiv)) {
        message("getting cached data")
        return(mtxiv)
    }
    data <- x$get()
    mtxiv <- solve(data)  ## Return a matrix that is the inverse of 'x'
    x$setinverse(mtxiv)
    mtxiv
}
Status API Training Shop Blog About Pricing
© 2016 GitHub, Inc. Terms Privacy Security Contact Help
