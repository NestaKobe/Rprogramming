#JohnHopkins University course in RProgramming with Dr Roger Peng

##Writing functions

#f <- function("argument"){}
  
  #--Example 1--
  add2 <- function(x,y) {
    x+y
  }

  add2(3,5)  
    #[1] 8
  
  #--Example 2--
  above10 <- function(x) {
    use <- x > 10
    x[use]
  }
  
  above <- function(x, n) {
    use <- x > n
    x[use]
  }
  
  x <- 1:20
  above(x)
    #Error in above(x) : argument "n" is missing, with no default
    above(x, 13)  
      #[1] 14 15 16 17 18 19 20
    
    #another way to avoid this
    above <- function(x, n=10) { #n = 10 default value
      use <- x >n
      x[use]
    }
    
    above(x)
      #[1] 11 12 13 14 15 16 17 18 19 20
    
  #--Example 3--
  #Matrix
  
  columnmean <- function(y) {
    nc <- ncol(y) #calc No of columns
    means <- numeric(nc)
    for(i in 1:nc) {
      means[i] <- mean(y[, i])
    }
    means
  }
  
  columnmean(airquality)
    #[1]        NA        NA  9.957516 77.882353  6.993464
    #[6] 15.803922
    
    columnmean <- function(y, removeNA = TRUE) {
      nc <- ncol(y) #calc No of columns
      means <- numeric(nc)
      for(i in 1:nc) {
        means[i] <- mean(y[, i], na.rm = removeNA)
      }
      means
    }

    columnmean(airquality)
      #[1]  42.129310 185.931507   9.957516  77.882353   6.993464
      #[6]  15.803922
      columnmean(airquality, FALSE) #back to old behaviour
        #[1]        NA        NA  9.957516 77.882353  6.993464
        #[6] 15.803922
      
  
  #---
  mydata <- rnorm(100)
  sd(mydata)
    sd(x = mydata) #named argument
    sd(x = mydata, na.rm = FALSE) #na.rm missing data to be removed or not
    sd(na.rm = FALSE, x = mydata)
    sd(na.rm = FALSE, mydata)


# Lazy evaluation ---------------------------------------------------------
#evaluated only as needed
    
  f <- function(a,b) {
    a^2
  }

  f(2)
    #[1] 4
  
  #doesn't consider b as function never uses argument b
  #2 gets positionally matched to a


# The "..." argument ------------------------------------------------------
#indicate a variable number of arguments usually passed on to other functions

  myplot <- function(x, y, type = "1", ...) {
    plot(x, y, type = type, ...)
  }
  
  #or using "..." for arguments before
  # args(paste)
  # function(..., sep = " ", collapse = NULL)
  #necessary to mention any argument that follow after
  



# Scoping -----------------------------------------------------------------
  
  search()
  
  #lexical scoping, static scoping, dynamic scoping
  #R uses search list to bind a value to a symbol
  #parent environment
    
  #Lexical scoping
  make.power <- function(n) {
    pow <- function(x) {
      x^n
    }
    pow
  }

  cube <- make.power(3)  
  square <- make.power(2)   

  cube(3)
    #[1] 27
  square(3)
    #[1] 9 
  
  #Explorin a function closure
  
  ls(environment(cube))
    #[1] "n"   "pow"
  get("n", environment(cube))
    #[1] 3
  
  ls(environment(square))
    #[1] "n"   "pow"
  get("n", environment(square))
    #[1] 2
  
  #Lexical vs dynamic scoping
  y <- 10

  f <- function(x) {
    y <-2
    y^2 + g(x)
  }  
  g <- function(x) {
    x*y
  }  

  f(3)  
    #[1] 34
  

# Optimization ------------------------------------------------------------

  #Routines require to pass a function whose argument is a vector of parameters - e.g. log-likelihood
  optim()
  nlm()
  optimize()
  
  #Maximizing a normal likelihood
  #Constructor function
  #need to use negative log-likelihood to minimize (optimize) functions
  make.NegLogik <- function(data, fixed=c(FALSE,FALSE)) {
    params <- fixed
    function(p) {
      params[!fixed] <- p
      mu <- params[1]
      sigma <- params [2]
      a <- -0.5*length(data)*log(2*pi*sigma^2)
      b <- -0.5*sum((data-mu)^2) / (sigma^2)
      -(a + b)
    }
  }
  
  set.seed(1); normals <- rnorm(100, 1, 2)
  nLL <- make.NegLogik(normals)
  nLL  
  
  ls(environment(nLL))
    #[1] "data"   "fixed"  "params"
  
  #Estimating parameters
  optim(c(mu = 0, sigma =1), nLL)$par
    #      mu    sigma 
    #1.218239 1.787343
  
    #Fixing sigma = 2
    nLL <- make.NegLogik(normals, c(FALSE, 2))
    optimize(nLL, c(-1, 3))$minimum
      #[1] 1.217775
    
    #Fixing mü (µ) = 1
    nLL <- make.NegLogik(normals, c(1, FALSE))
    optimise(nLL, c(1e-6, 10))$minimum
      #[1] 1.800596
    
  #Plotting likelihood
  nLL <- make.NegLogik(normals, c(1, FALSE))
  x <- seq(1.7, 1.9, len = 100)    
  y <- sapply(x,nLL)    
  plot(x, exp(-(y - min(y))), type = "l")
  
  nLL <- make.NegLogik(normals, c(FALSE, 2))
  x <- seq(0.5, 1.5, len = 100)    
  y <- sapply(x,nLL)    
  plot(x, exp(-(y - min(y))), type = "l")
  

# Dates & times -----------------------------------------------------------

  x <- as.Date("1970-01-01")
  x
    #[1] "1970-01-01"
  unclass(x)
    #[1] 0 #shows how many days since 01/01/1970
      d2 <- as.Date("1969-01-01")
      unclass(d2)
        #[1] -365
  unclass(as.Date("1970-01-02"))
    #[1] 1
  
  #TIMES represented using POSIXct or POSIXlt class
  POSIXct #large integer; useful class when you want to store times in a data frame
  POSIXlt #is a list underneath and stores info like day of the week, day of the year etc.
  
  x <- Sys.time()
  x   
    #[1] "2021-01-05 16:08:52 CET"
  p <- as.POSIXlt(x)
  names(unclass(p))
    #[1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"  
    #[8] "yday"   "isdst"  "zone"   "gmtoff"
  p$sec
    #[1] 52.95481
      
      unclass(p)
        #$sec
        #[1] 52.95481
        
        #$min
        #[1] 8
        
        #etc

        str(unclass(p))
          #List of 11
          #$ sec   : num 53
          #$ min   : int 8
          #$ hour  : int 16
          #$ mday  : int 5
          #$ mon   : int 0
          #$ year  : int 121
          #$ wday  : int 2
          #$ yday  : int 4
          #$ isdst : int 0
          #$ zone  : chr "CET"
          #$ gmtoff: int 3600
          #- attr(*, "tzone")= chr [1:3] "" "CET" "CEST"
        
  difftime(Sys.time(), p, units = 'days')
  
  #DATES written in a different format
  datestring <- c("January 10, 2012 10:40", "December 9, 2011 09:10")
  x <- strptime(datestring, %B %d, %Y %H:%M)
  x
  
  class(x)
    #[1] "POSIXct" "POSIXt" 
  
  
  x <- as.Date("2012-03-01"); y <- as.Date("2012-02-28")
  x-y
    #Time difference of 2 days
  
  x <- as.POSIXct("2012-10-25 01:00:00")
  y <- as.POSIXct("2012-10-25 06:00:00", tz="GMT")
  
  y-x  
    #Time difference of 7 hours
  
  
  library(swirl)
  swirl()  
  S
  
  evaluate <- function(func, dat){
    func(dat)
    # Write your code here!
    # Remember: the last expression evaluated will be returned! 
    }
  
  evaluate(function(x){x+1}, 6)
    #[1] 7
  evaluate(function(x){x[1]}, c(8,4,0))
    #[1] 8
  evaluate(function(x){x[-1]}, c(8,4,0))
    #[1] 4 0
  
  
  