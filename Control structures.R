#JohnHopkins University course in RProgramming with Dr Roger Peng

##Control structures


# If-else -----------------------------------------------------------------

  if("condition x") {
    ##do something
  } else {
    ##do something else
  }
  
  if("condition x") {
    ##do something
  } else if("condition y") {
    ##do something different
  } else {
    ##do something else
  }

    #Valid if/else structure
      if(x>3) {
        y <- 10
      } else {
        y<- 0
      }
      
    #or
      y <- if(x>3){
        10
      } else {
        0
      }
      

# For loops ---------------------------------------------------------------
#Take interator variable and assign it successive values from a sequence or vector.
#Most commonly used for iterating over the elements of an object (list, vector)
      
  for(i in 1:10) {
    print(i)
  }

  #Example
  x <- c("a","b","c","d")
  
  #Four different loops having same behaviour:

  for(i in 1:4) {
    print(x[i])
  }
    #[1] "a"
    #[1] "b"
    #[1] "c"
    #[1] "d"
  
  for(i in seq_along(x)) {
    print(x[i])
  }

  for(letter in x) {
    print(letter)
  }      
  
  for(i in 1:4) print(x[i]) #easier to read when having only a single expression
  
  #for loops can be nested
    #nesting beyond 2-3 levels often difficult to read/understand
  
  x<- matrix(1:6, 2, 3)

  for(i in seq_len(nrow(x))) {
    for(j in seq_len(ncol(x))) {
      print(x[i,j])
    }
  }  
    #[1] 1
    #[1] 3
    #[1] 5
    #[1] 2
    #[1] 4
    #[1] 6
  

# While loops -------------------------------------------------------------
#begin testing a condition; if TRUE then execute loop body.
#once loop body is executed, condition is tested again and so forth
#can result in infinite loops if not written properly
  
  count <- 0
  while(count < 10) {
    print(count)
    count <- count +1
  }  
  
  z <- 5
  while(z >= 3 && z <= 10) {
    print (z)
    coin <-rbinom(1,1,0.5)
    if(coin == 1) { ##random walk
      z <- z+1
    } else{
        z <- z-1
      }
  }  


# Repeat,  Next,  Break ---------------------------------------------------

 #Repeat initiates an infinite loop - exit a repeat loop through break
  
  x0 <- 1
  tol <- 1e-8  
  
  repeat {
    x1 <- computeEstimate()
    if(abs(x1 - x0) < tol) {
      break
    } else {
      x0 <- x1
    }
  }
  
  #Next is used to skip an iteration of a loop
  
  for(i in 1:100) {
    if(i <= 20) { #Skip the first 20 iterations
      next
    }
    ##Do something here
  }
  
  return() #signals that a function should exit and return to a given value

  
  