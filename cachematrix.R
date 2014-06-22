****************************************************************************************
## Two functions are to be created. The first is to create a special matrix object 
## that can cache its inverse while the second function will compute the matrix inverse
## If the inverse has already been calculated (and the matrix has not changed), 
## then the second function will retrieve the inverse from the cache.

****************************************************************************************

## makeCacheMatrix: creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
 	 m<-NULL				#initialize the null matrix
 	 set<-function(y){
  	x<<-y					#define the set functions
 	 m<<-NULL
}
	get<-function() x
	setmatrix<-function(solve) m<<- solve	#solve fnx is used to calculate inverse
	getmatrix<-function() m
	list(set=set, get=get,
   	setmatrix=setmatrix,			#state list
   	getmatrix=getmatrix)
}

## cacheSolve:Function computes the inverse of the special "matrix"
## If the inverse has already been calculated (and the matrix has not changed), 
## it will retrieve the inverse from the cache

cacheSolve <- function(x=matrix(), ...) {
    	m<-x$getmatrix()
    	if(!is.null(m)){
      	message("getting cached data")		#check if inverse already calculated and
      	return(m)				#still same otherwise calculate the inverse
    }
    	matrix<-x$get()
    	m<-solve(matrix, ...)
    	x$setmatrix(m)
    m
}					 	#return a matrix that is the inverse of 'x'

