#JohnHopkins University course in RProgramming with Dr Roger Peng

##Debugging

message   #generic notification produced; execution of the function continues
warning   #indication something is wrong but not necessarily fatal; execution of the function continues
error     #indication that a fatal problem has occured' execution stops' produced by the stop function
condition #generic concept indication that something uexpected can occur

  #Example 1
  log(-1)
    #[1] NaN
    #Warning message:
    #  In log(-1) : NaNs produced

  #Example 2
  printmessage <- function(x) {
    if(x > 0)
      print("x is greater than zero")
    else
      print("x is less than or equal to zero")
    invisible(x) #function that prevents auto printing
  }
  
  printmessage(1)
    #[1] "x is greater than zero"
  printmessage(NA)
    #Error in if (x > 0) print("x is greater than zero") else print("x is less than or equal to zero") : 
    #  missing value where TRUE/FALSE needed

    printmessage2 <- function(x) {
      if(is.na(x))
        print("x is a missing value!")
      else 
        if (x>0)
        print("x is greater than zero")
      else
          print("x is less than or equal to zero")
      invisible(x)
    }
    
    x <- log(-1)
      #Warning message:
      #In log(-1) : NaNs produced
    
    printmessage2(x)
      #[1] "x is a missing value!"



# Debugging tools ---------------------------------------------------------

#Primary tools for debugging functions in R are

traceback #prints out function call stack after an error occurs
debug     #flags a function for "debug" mode which allows you to step through execution of a function one line at a time
browser   #suspends the execution of a function wherever it's called and puts the function in debug mode
trace     #allows to insert debugging code into a function at specific places
recover   #allows to modify the error behaviour so that you can browse the function call stack


# Traceback ---------------------------------------------------------------
#useful to provide when communicating with someone

mean(x)
  #Error in mean(x) : object 'x' not found
traceback()
  #1: mean(x)

lm(y-x)
  #Error in stats::model.frame(formula = y - x, drop.unused.levels = TRUE) : 
  #object 'y' not found
traceback()
  #4: stats::model.frame(formula = y - x, drop.unused.levels = TRUE)
  #3: eval(mf, parent.frame())
  #2: eval(mf, parent.frame())
  #1: lm(y - x)


# Debug -------------------------------------------------------------------

debug(lm)
lm(y-x)
  #debug: {
  #  ret.x <- x
  #  ret.y <- y
  #  cl <- match.call()
  ## ...
  # z$qr <- NULL
  #z
  #}
  #Browse[2]>
    #Browse[2]>n #n & enter to go line by line
  
  #you can even all debug() on a function within the debug
  

# Recover -----------------------------------------------------------------

options(error = ecover) #will set global option - will only disappear when you quit R
read.csv("nosuchfile")
  #Error in file(file, "rt") : cannot open the connection
  #In addition: Warning message:
  #  In file(file, "rt") :
  #  cannot open file 'nosuchfile': No such file or directory

  #should open a menu ("enter a frame number")

    
