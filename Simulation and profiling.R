#JohnHopkins University course in RProgramming with Dr Roger Peng

##Simulation and profiling

str() #display structure
#Alternative to summary

library(datasets)
head(airquality)
  #Ozone Solar.R Wind Temp Month Day
  #1    41     190  7.4   67     5   1
  #2    36     118  8.0   72     5   2
  #3    12     149 12.6   74     5   3
  #4    18     313 11.5   62     5   4
  #5    NA      NA 14.3   56     5   5
  #6    28      NA 14.9   66     5   6

str(airquality)
#'data.frame':	153 obs. of  6 variables:
#$ Ozone  : int  41 36 12 18 NA 28 23 19 8 NA ...
#$ Solar.R: int  190 118 149 313 NA NA 299 99 19 194 ...
#$ Wind   : num  7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
#$ Temp   : int  67 72 74 62 56 66 65 59 61 69 ...
#$ Month  : int  5 5 5 5 5 5 5 5 5 5 ...
#$ Day    : int  1 2 3 4 5 6 7 8 9 10 ...

s <- split(airquality, airquality$Month)
str(s)
  #List of 5
  #$ 5:'data.frame':	31 obs. of  6 variables:
  #..$ Ozone  : int [1:31] 41 36 12 18 NA 28 23 19 8 NA ...
  #..$ Solar.R: int [1:31] 190 118 149 313 NA NA 299 99 19 194 ...
  #..$ Wind   : num [1:31] 7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
  #..$ Temp   : int [1:31] 67 72 74 62 56 66 65 59 61 69 ...
  #..$ Month  : int [1:31] 5 5 5 5 5 5 5 5 5 5 ...
  #..$ Day    : int [1:31] 1 2 3 4 5 6 7 8 9 10 ...


# Random numbers ----------------------------------------------------------

rnorm() #generate random normal variables with a given mean and SD
dnorm() #evaluate normal probability density with a given mean/SD at a ponint or vector of points
pnorm() #evaluate the cumulative distribution function for a normal distribution
rpois() #generate random poisson variates with a given rate

#four functions associated with them
r #for random number generation
d #for density
p #for cumulative distribution
q #for quantile function

#working with normal distributions requires using these four functions

dnorm(x, mean = 0, sd = 1, log = FALSE) #if evaluating density for normal distrib. use log = TRUE
pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE) #if upper tail --> lower.tail = FALSE
qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
rnorm(n, mean = 0, sd = 1)

#if phi is the cumulative distribution function for a standard normal distribution
#the pnorm(q) = phi(q) and qnorm(p)= phi^-1(p)

  #Example
  x <- rnorm(10,20,2)
  summary(x)
    #Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    #15.91   18.91   19.41   19.40   20.19   22.19 
  
  #Setting random number seed ensure reproducibility
  
  set.seed(1) #to come back to first generated sequence of random variables
  rnorm(5)
    #[1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
  rnorm(5)
    #[1] -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884
  
    set.seed(1)
    rnorm(5)
    #[1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
    
  #Generating Poisson data
  
  rpois(10,1) #10 variables with rate 1
  rpois(10,20) #10 variables with rate 20
    #[1] 26 21 17 18 18 21 16 23 22 24
  
    #Cumulative distribution
    ppois(2,2) #variable less or equal to 2 if the rate is 2
      #[1] 0.6766764 #Pr(x <= 2)
    
    

# Linear model ------------------------------------------------------------

  set.seed(20)
  x <- rnorm(100)
  e <- rnorm(100, 0, 2)
  y <- 0.5 + 2 *x + e
  summary(y)
    #   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    #-6.4084 -1.5402  0.6789  0.6893  2.9303  6.5052
  plot(x, y)    

  #When x is binary
  set.seed(10)
  x <-rbinom(100, 1, 0.5)
  e <- rnorm(100, 0, 2)
  y <- 0.5 + 2 * x +e
  summary(y)
    #   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    #-3.4936 -0.1409  1.5767  1.4322  2.8397  6.9410 
  plot(x, y)
  
  #Poisson model
  set.seed(1)
  x <-rnorm(100)
  log.mu <- 0.5 + 0.3 * x  
  y <- rpois(100, exp(log.mu))  
  summary(y)
    #Min. 1st Qu.  Median  Mean 3rd Qu.  Max. 
    #0.00    1.00    1.00  1.55 2.00    6.00 
  plot(x,y)
  

# Random sampling ---------------------------------------------------------
#The sample() function draws randomly form a specified set of (scalar) objects
#allowing to sample from arbitrary distributions
  
  set.seeed(1)  
  sample(1:10, 4)
    #[1]  9 10  3  1
  sample(letters,5)
    #[1] "o" "y" "f" "x" "d"
  sample(1:10) #permutation without replacement
    #[1]  3 10  5  1  7  6  9  2  8  4
    sample(1:10, replace = TRUE) #sample with replacement
      #[1]  7  4  4 10  8  1 10  2 10  1
    
  
  