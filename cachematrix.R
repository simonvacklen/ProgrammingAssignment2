
## This fucntion creates a list of 2 functions and a variable, the variable works as "storage" for a 
## matrix if it has been inverter, othewise its NULL the 2 functinos is 
## 1. On that returns the inverse if it has been calculated, 2. on that calculates it if it has not been calculated before
makeMatrix <- function(x = matrix()) {
        inv <- NULL
        get <- function() x
        solvematrix <- function(solve) inv <<- solve
        getinv <- function() inv
        list(get = get,
             solvematrix = solvematrix,
             getinv = getinv)
}


## this function checks if the inverted matric exists, if it is not NULL, it returns the cached one, otherwise it inverts it

cacheinv <- function(x, ...) {
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$solvematrix(inv)
        inv
}
