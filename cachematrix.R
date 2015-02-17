# Matrix inversion is an expensve operation, especially for a large matrix.
# Caching the results of this operation is beneficial if the matrix is unchanged.
# The two functions create a cache matrix and cache the the inverse of that matrix


# Usage:
#       x is a matrix
#       mymatrix <- makeCacheMatrix(x)
#       cacheSolve(mymatrix)
#
# Example:
#       > mymat <- matrix(c(1,5,2,6,9,10, 1, 5,6), nrow=3)
#       > mycmat <- makeCacheMatrix(mymat)
#       > cacheSolve(mycmat)
#               [,1]        [,2]  [,3]
#       [1,] -0.04761905  0.30952381 -0.25
#       [2,]  0.23809524 -0.04761905  0.00
#       [3,] -0.38095238 -0.02380952  0.25


# The makeCacheMatrix function creates the matrix and is used to 
# - get and set the value of the matrix
# - get and set the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        
        invmat <- NULL
        
        # Function to set the value of the matrix
        set <- function(y){
                x <<- y
                invmat <<- NULL
        }
        
        #Function to get the value of the matrix
        get <- function()x
        
        #Function to set the value of the inverse of the matrix
        setinvmat <- function(inversemat) invmat <<- inversemat
        
        #Function to get the value of the inverse of the matrix
        getinvmat <- function() invmat
        
        list(set=set, get=get, setinvmat=setinvmat, getinvmat=getinvmat)
        
}

# The cacheSolve function returns the inverse of the matrix. 
# It assumes that the matrix has not changed and is inversible
# It checks if the inverse matrix is available in cache
# If it does, it returns it without computing again
# If it is not available in cache, it computes the inverse, saves it to cache
# and returns the inverse of the matrix

cacheSolve <- function(x, ...) {
        
        # Get "inverse matrix" from cache
        invmat <-x$getinvmat()
                
        # If not null i.e inverse matrix is available in cache
        # return inverse matrix from cache
        if (!is.null(invmat)){
                message("Getting matrix data from cache")
                return(invmat)
        }
        
        #if cache does not hold the inverse matrix,
        #compute the inverse, store it in cache and return the inverse matrix
        matdata <-x$get()
        invmat <- solve(matdata)
        x$setinvmat(invmat)
        invmat
                

}
