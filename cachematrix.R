# Matrix inversion is an expensve operation, especially for a large matrix.
# Caching the results of this operation is beneficial if the matrix is unchanged.
# The following two functions create and cache the the inverse of a matrix

# The makeCacheMatrix function is used to 
# - get and set the value of the matrix
# - get and set the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {

}

# The cacheSolve function returns the inverse of the matrix. 
# It assumes that the matrix is inversible
# It checks if the inverse matrix is available in cache
# If it does, it returns it without computing again
# If it is not available in cache, it computes the inverse, saves it to cache
# and returns the inverse of the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
