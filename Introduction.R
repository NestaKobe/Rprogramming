#JohnHopkins University course in RProgramming with Dr Roger Peng

#Command Shift & R --> make sections

#Set working directory
setwd("~/Documents/RStudio")

#What version of RStudio?
version
sessionInfo()

#Get help with your package - to know which functions it contains
help(package="gglpot2")
#Extended help files - include detailed functions
browseVignettes("gglpot2")


#get your working directory
getwd()

#or files from directory
dir()

#List objects in workspace
ls()

#read CSV
read.csv()



# Function example --------------------------------------------------------
    myfunction <- function(x) {
      y <- rnorm(100)
      mean (y)
    }
    myfunction()
    
    second <- function(x) {
      x + rnorm(length(x))
    }
    second(4)
    second(4:10) #four to ten


    
# Sequences ---------------------------------------------------------------
    x <- 1:20
    x

# Vectors -----------------------------------------------------------------
##Creating vectors of objects c()

    x <- c(0.5, 0.6)    #numeric
    x <- c(TRUE, FALSE) #logical
    x <- c(T, F)        #logical
    x <- c("a", "b","c") #character
    x <- 9:29           #integer
    x <- c(1+0i, 2+4i)  #complex

##Using the vector() function
    
    x <- vector("numeric", length=10)
    x

# Coercion - as.* ---------------------------------------------------------
##Explicit coercion as.* function
  # objects can be explicitly coerced from one class ot another using the as.* functions
    x <- 0:6
    class(x) #integer
    
    as.numeric(x) #transform to numeric
    
    as.logical(x) #true/false
    
    as.character(x)

  # Nonsensical coercion result in NAS
    x <-c("a","b","c")
    as.numeric(x)
    as.logical(x)
    as.complex(x)


# Lists -------------------------------------------------------------------

    x <-list(1, "a", TRUE, 1+4i)
    x

# Matrices ----------------------------------------------------------------
    m <- matrix(nrow=2, ncol=3)
    m

    dim(m) #dimension attributes
    attributes(m)

  #Matrices are constructed column-wise
    m <- matrix(1:6, nrow = 2, ncol = 3)
    m

  #Matrices directly created from vectors by adding dimension attribute
    m <- 1:10
    m

    dim(m) <-c(2,5) #two rows, five columns
    m
        #      [,1] [,2] [,3] [,4] [,5]
        #[1,]    1    3    5    7    9
        #[2,]    2    4    6    8   10



# Binding columns / rows --------------------------------------------------

    x <- 1:3
    y <- 10:12
    
    cbind(x,y)
      #     x  y
      #[1,] 1 10
      #[2,] 2 11
      #[3,] 3 12
    
    rbind(x,y)
      #   [,1] [,2] [,3]
      #x    1    2    3
      #y   10   11   12


# Factors -----------------------------------------------------------------
  #categorical data
  #unordered / ordered

  lm()
  glm()

    x <- factor(c("yes","yes", "no", "yes", "no"))
    x
      #[1] yes yes no  yes no 
      #Levels: no yes
  
    table(x)
      # no yes 
      # 2   3
  
    unclass(x) #because no is before yes in the alphabet, no becomes 1 & yes 2
      # [1] 2 2 1 2 1
      # attr(,"levels")
      #[1] "no"  "yes"
  
  #Order of levels - levels argument to factor() - reverse levels of y/n
    x <- factor(c("yes","yes", "no", "yes", "no"),
                levels=c("yes","no"))
    x
      #[1] yes yes no  yes no 
      #Levels: yes no

##Missing values NA/NaN


# Missing values NA/NaN ---------------------------------------------------
 #denoted by NA or NaN for undefined mathematical operations

is.na() #used to test objects if they are NA
is.nan() #used to test for NAN

  #Example
    x <- c(1,2,NA,10,3)

    is.na(x)
      #[1] FALSE FALSE  TRUE FALSE FALSE

    is.nan(x)
      #[1] FALSE FALSE FALSE FALSE FALSE

    x <- c(1,2,NaN,NA,4)
    is.na(x)
      #[1] FALSE FALSE  TRUE  TRUE FALSE
    is.nan(x)
      #[1] FALSE FALSE  TRUE FALSE FALSE


