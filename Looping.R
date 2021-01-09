#JohnHopkins University course in RProgramming with Dr Roger Peng

##Looping

lapply()  #loop over a list and evaluate a function on each element
  split()   #auxiliary function; useful in conjunction with lapply
sapply()  #same as lapply byt try to simplify result
apply()   #apply a function over the margins of an array
tappyl()  #apply a function over subsets of a vector
mapply()  #multivariate version of lapply


# Lapply ------------------------------------------------------------------

#lapply() - always returnss a list, regardless of the class of the input

#takes 3 arguments
#(1) a list X
#(2) a function FUN
#(3) other arguments passed via the "..." argument
#If X is not a list; it will be coerced to a list using as.list

#  function (X, FUN, ...) {
#      FUN <- match.fun(FUN)
#      if (!is.vector(x) || is.object(X))
#          X <- as.list(X)
#          .Internal(lapply(X,FUN))
#  }

  #Example 1
  x <- list(a = 1:5, b=rnorm(10))
  lapply(x,mean)
    #$a
    #[1] 3
    
    #$b
    #[1] -0.0474927
  
  #Example 2
  x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100,5))
  lapply(x,mean)
    #$a
    #[1] 2.5
    #$b
    #[1] 0.1031459
    #$c
    #[1] 1.021397
    #$d
    #[1] 4.913271
  
  #Example 3
  x <- 1:4
  lapply(x, runif) 
  #runif generates uniform random variables; runif(1) gives vector of 1, 
  #if runif(3) gives vector of 3 elements
  
    #[[1]]
    #[1] 0.1176082
    
    #[[2]]
    #[1] 0.8173045 0.4288825
    
    #[[3]]
    #[1] 0.88594223 0.03584393 0.08609048
    
    #[[4]]
    #[1] 0.6526724 0.6227696 0.9897951 0.8272825
  
  #if generating a uniform randomization that is not between 0 - 1 (standard)
  x <- 1:4
  lapply(x, runif, min = 0, max = 10)  
  
  #Example 4
  x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
  x
  
  lapply(x, function(elt) elt[,1]) #function (with (random) argument elt) to extract first column 
    #$a
    #[1] 1 2
    
    #$b
    #[1] 1 2 3
 
  
  #Swirl
  library(swirl)
  
  flag_colors <- flags[,11:17]
  head(flag_colors)
  #red green blue gold white black orange
  #1   1     1    0    1     1     1      0
  #2   1     0    0    1     0     1      0
  #3   1     1    0    0     1     0      0
  #4   1     0    1    1     1     0      1
  #5   1     0    1    1     0     0      0
  #6   1     0    0    1     0     1      0
  
  lapply(flag_colors, sum)
  
    sapply(flag_colors, sum)
      #red  green   blue   gold  white  black orange 
      #153     91     99     91    146     52     26 
    sapply(flag_colors, mean)
      #red     green      blue      gold     white     black    orange 
      #0.7886598 0.4690722 0.5103093 0.4690722 0.7525773 0.2680412 0.1340206
    sapply(flags, unique)
      #$name
      #...
      #$landmass
      #...
      #etc.
      

# Sapply ------------------------------------------------------------------

#sapply() tries to simplify results of lapply
  #IF result is a list where every element is length 1, then a vector is returne
  #IF result is a list where every element is a vector of the same length (>1), a matrix is returned
  #IF it can't figure things out, a list is returned

  #Example
  x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100,5))
  lapply(x,mean)
    #$a
    #[1] 2.5
    #$b
    #[1] 0.1031459
    #$c
    #[1] 1.021397
    #$d
    #[1] 4.913271
  
  sapply(x,mean)
    #a          b          c          d 
    #2.5000000 -0.1088347  0.9565132  5.1073590 
  

# Apply -------------------------------------------------------------------

#apply() is used to evealuate a function (often an anonymous one) over the margins of an array
  #IT is most often used to apply a function to the rows or columns of a matrix
  #IT can be used with general arrays, e.g. taking the average of an array of matrices
  #IT is not really faster than writing a loop, but it works in one line
  
#str(apply(apply)
#function (X, MARGIN, FUN, ...)
  #X is an array
  #MARGIN is an integer vector indicating which margin should be "retained"
  #FUN is a function to be applied
  #"..." is for other arguments to be passed to FUN
  
  #Example 1
  x <- matrix(rnorm(200), 20, 10) #20 rows, 10 columns
  
  apply(x,2,mean) #gives mean for the 10 columns --> 2 = second argument of x function
    #[1] -0.46554415 -0.15024558 -0.04290119  0.07162635 -0.17055683
    #[6] -0.41507945 -0.08085641 -0.22090398  0.27955590  0.12840112
  
  apply(x,1,sum)
  #[1] -2.7731298 -6.5673432  1.0463630 -0.2697978 -3.9186800
  #[6] -1.5541688 -2.7489132 -3.5732130 -1.0099092  0.2722651
  #[11]  2.9063624 -2.8589211 -1.6718612  0.9377683  1.4127958
  #[16] -2.1523750  2.5191726  1.7849481 -5.2699721  2.1585246
  
  #Shortcuts for matrices
  rowSums()   # = apply(x, 1, sum)
  rowMeans()  # = apply(x, 1, mean)
  colSums()   # = apply(x,2,sum)
  colMeans()  # = apply(x,2,mean)
  
  #Other ways to apply()
  
  x <- matrix(rnorm(200), 20, 10)
  apply(x, 1, quantile, probs = c(0.25,0.75)) 
    #[,1]       [,2]       [,3]       [,4]         [,5]
    #25% -0.3595392 -0.7381480 -0.8608105 -0.8467473 -0.005430289
    #75%  0.8183210  0.4882724  0.7953324  0.3935411  0.844303042
    #[,6]       [,7]       [,8]       [,9]      [,10]
    #25% -0.6773257 -0.7536480 -0.3637451 -0.4692308 -0.7697904
    #75%  0.9988044 -0.2912504  0.2512561  0.2395119  0.2656252
    #[,11]      [,12]      [,13]      [,14]      [,15]
    #25% -0.85716841 -0.2804947 -0.2636481 -0.6528386 -0.1883669
    #75% -0.06546022  0.9291787  0.7541303  0.6328182  0.6420148
    #[,16]     [,17]      [,18]      [,19]     [,20]
    #25% -1.70303244 0.1057787 -0.7169591 -0.4088963 -0.609516
    #75%  0.05409608 0.7258684  0.6426211  0.8010554  1.113790
  
  
  a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
  #c = 2 rows, 2 columns, 10 = third dimension   (bunch of 2x2 matrices bunched together)
  apply(a, c(1,2), mean) #collapse third dimension
    #[,1]       [,2]
    #[1,] 0.4171813 0.13857982
    #[2,] 0.2439589 0.07356082
  
    rowMeans(a, dim = 2)
      #[,1]       [,2]
      #[1,] 0.4171813 0.13857982
      #[2,] 0.2439589 0.07356082
    

# Mapply -----------------------------------------------------------------

#mapply() is a multivariate apply of sorts whcih applies a function in parallel over a set of arguments
  #str(mapply)
  #function(FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)
      #FUN is a function to apply
      #"..." contains arguments to apply over
      #MoreArgs is a list of other arguments to FUN
      #SIMPLIFY indicates wheter result should be simplified
    
  #Example
  list(rep(1,4), rep(2,3), rep(4,1))
  #--> easier to mapply
  mapply(rep, 1:4, 4:1)
    #[[1]]
    #[1] 1 1 1 1
    
    #[[2]]
    #[1] 2 2 2
    
    #[[3]]
    #[1] 3 3
    
    #[[4]]
    #[1] 4
  
  #Vectorizing a function
  noise <- function(n, mean, sd) {
    rnorm(n, mean, sd)
  }
  noise(5, 1, 2)  
    #[1] -0.01383295  2.65051865 -0.48242364 -0.40588314 -0.26047515
  noise(1:5, 1:5, 2)
    #[1] -0.6544636 -0.8654412 -0.2758197  3.6832544  2.7970740
  
  mapply(noise, 1:5, 1:5, 2) #instantly vecotrize function that doesn't allow for vector arguments
    #[[1]]
    #[1] 1.377637
    
    #[[2]]
    #[1]  1.089592 -1.037460
    
    #[[3]]
    #[1] 3.927978 3.171095 5.561635
    
    #[[4]]
    #[1] 1.696474 1.505609 2.915333 3.533764
    
    #[[5]]
    #[1] 4.711601 5.590564 5.083626 6.006778 4.806731 
  
    #is the same as
    list(noise(1,1,2), noise(2,2,2), noise(3,3,2,), noise(4,4,2), noise(5,5,2))


# Tapply ------------------------------------------------------------------

#tapply() is used to apply a function over subsets of a vector.
  #str(tapply)
  #function(X, INDEX, FUN = NULL, ..., simplify = TRUE)
    #X is a vector
    #INDEX is a factor or a list of factors
    #FUN is a function to be applied
    #"..." contains other arguments to be passed to FUN
    #simplify - simplify result
    
    x <- c(rnorm(10), runif(10), rnorm(10,1))
    f <- gl(3, 10) #factor variable
    #function gl(n, k, length = n*k, labels = seq_len(n), ordered = FALSE)
    #Argument n is an integer giving the number of levels.
    #Argument k is an integer giving the number of replications
    f
      #1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3
      #[30] 3
      #Levels: 1 2 3
    
    tapply(x, f, mean)
    #        1         2         3 
    #0.1880470 0.4772382 0.7894115
    
    #take group means without simplification
    tapply(x, f, mean, simplify = FALSE)
      #$`1`
      #[1] 0.188047
    
      #$`2`
      #[1] 0.4772382
    
      #$`3`
      #[1] 0.7894115
    
    #find group ranges
    tapply(x, f, range) #getting a vector of length two
      #$`1`
      #[1] -1.304045  1.626515
      
      #$`2`
      #[1] 0.02420434 0.97541320
      
      #$`3`
      #[1] -2.755187  2.493320
    
    #Swirl
    vapply() #counterpart to sapply()
    tapply()
    
    vapply(flags, class, character(1))
      #name    landmass        zone        area  population    language    religion        bars     stripes     colours         red       green 
      #"character"   "integer"   "integer"   "integer"   "integer"   "integer"   "integer"   "integer"   "integer"   "integer"   "integer"   "integer" 

    tapply(flags$animate, flags$landmass, mean)
      #1         2         3         4         5         6 
      #0.4193548 0.1764706 0.1142857 0.1346154 0.1538462 0.3000000 
      
    
    
# Split -------------------------------------------------------------------

#split() takes a vector or other objects and splits it into groups determined by a factor or list of factors
  #str(split)
  #function(x, f, drop = FALSE, ...)
    #x is a vector (or list) or data frame
    #f is a factor (or coerced to one) or a list of factors
    #drop indicates whether empty factor levels should be dropped
  
  #Example
  x <- c(rnorm(10), runif(10), rnorm(10,1))
  f <- gl(3, 10) #see description under --tapply--
  split(x,f) #always returns a list
    #$`1`
    #[1]  0.47451346 -0.24011631 -0.70717530  0.83869657
    #[5] -0.02939529  0.47104570 -0.36907459  0.26552180
    #[9]  0.88416254  0.76630146
    
    #$`2`
    #[1] 0.9328249 0.2169516 0.3857552 0.4794132 0.8607284
    #[6] 0.2491795 0.7036147 0.9191737 0.8025924 0.6491810
    
    #$`3`
    #[1]  0.57553915  1.01471961 -0.99076667  0.65471504
    #[5]  0.31686070  1.25620186  0.31655353  0.45319732
    #[9] -0.28930486 -0.02380777
  
      lapply(split(x, f), mean)
        #$`1`
        #[1] 0.235448
        #$`2`
        #[1] 0.6199415
        #$`3`
        #[1] 0.3283908
  
  #Splitting data frames
  library(datasets)
  head(airquality)
    #Ozone Solar.R Wind Temp Month Day
    #1    41     190  7.4   67     5   1
    #2    36     118  8.0   72     5   2
    #3    12     149 12.6   74     5   3
    #4    18     313 11.5   62     5   4
    #5    NA      NA 14.3   56     5   5
    #6    28      NA 14.9   66     5   6
  
  s <- split(airquality, airquality$Month)
  lapply(s, function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")])) #x is an anonymous function
    #$`5`
    #Ozone  Solar.R     Wind 
    #NA       NA 11.62258 
    
    #$`6`
    #Ozone   Solar.R      Wind 
    #NA 190.16667  10.26667 
    
    #$`7`
    #Ozone    Solar.R       Wind 
    #NA 216.483871   8.941935 
    
    #$`8`
    #Ozone  Solar.R     Wind 
    #NA       NA 8.793548 
    
    #$`9`
    #Ozone  Solar.R     Wind 
    #NA 167.4333  10.1800 
  
  sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
    #               5         6          7        8        9
    #Ozone         NA        NA         NA       NA       NA
    #Solar.R       NA 190.16667 216.483871       NA 167.4333
    #Wind    11.62258  10.26667   8.941935 8.793548  10.1800
  
    sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
      #                5         6          7          8         9
      #Ozone    23.61538  29.44444  59.115385  59.961538  31.44828
      #Solar.R 181.29630 190.16667 216.483871 171.857143 167.43333
      #Wind     11.62258  10.26667   8.941935   8.793548  10.18000
    
  #Slitting on more than one level
  x <- rnorm(10)
  f1 <- gl(2, 5) #2 variables, 5 times each
    # [1] 1 1 1 1 1 2 2 2 2 2
    #Levels: 1 2
  f2 <- gl(5, 2) #5 variables, 2 times each
    #[1] 1 1 2 2 3 3 4 4 5 5
    #Levels: 1 2 3 4 5
  interaction(f1, f2)
    #[1] 1.1 1.1 1.2 1.2 1.3 2.3 2.4 2.4 2.5 2.5
    #10 Levels: 1.1 2.1 1.2 2.2 1.3 2.3 1.4 ... 2.5
  
    #interactions can create empty levels
    str(split(x, list(f1, f2)))
      #List of 10
      #$ 1.1: num [1:2] -0.663 -1.505
      #$ 2.1: num(0) 
      #$ 1.2: num [1:2] 0.796 1.256
      #$ 2.2: num(0) 
      #$ 1.3: num -1.01
      #$ 2.3: num 1.22
      #$ 1.4: num(0) 
      #$ 2.4: num [1:2] -0.181 -0.282
      #$ 1.5: num(0) 
      #$ 2.5: num [1:2] 1.3948 -0.0293
    
      str(split(x, list(f1, f2), drop = TRUE))
        #$ 1.1: num [1:2] -0.663 -1.505
        #$ 1.2: num [1:2] 0.796 1.256
        #$ 1.3: num -1.01
        #$ 2.3: num 1.22
        #$ 2.4: num [1:2] -0.181 -0.282
        #$ 2.5: num [1:2] 1.3948 -0.0293
      
      
    
    
  