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
#List all the files in your working directory
list.files()
dir()

file.exists()
file.info()
file.rename() #use comma as separator to rename from example1 to example2
file.remove()
file.copy()
file.path()

dir.create(file.path("",""), recursive=TRUE) #for two subfolders "",""
unlink("", recursive=TRUE) #to delete a folder

#read CSV
read.csv()

#Determine arguments
args(list.files)
  #function (path = ".", pattern = NULL, all.files = FALSE, full.names = FALSE, 
  #recursive = FALSE, ignore.case = FALSE, include.dirs = FALSE, 
  #no.. = FALSE) 
  #NULL

#Random sampling
example <- sample(c(y,z), 100) #random sampling of a 100 values from vectors y & z

# Question ----------------------------------------------------------------

?function_name_here

# Function example --------------------------------------------------------
  myfunction <- function(x) {
      y <- rnorm(100)
      mean (y)
    }
  myfunction()
      #[1] 0.00590302
    
  second <- function(x) {
      x + rnorm(length(x))
    }
  second(4)
    #[1] 3.312413
  second(4:10) #four to ten


# Sequences ---------------------------------------------------------------
    x <- 1:20
    x

    #or
    seq(1,20)
      seq(0,10, by=0.5) #a sequence by steps of 0.5
      seq(5,10, length=30) #a sequence with a length of 30 from 5 to 10
        length() #to check what length your sequence has
        seq_along(); seq(along.with=)

        
# Replicates --------------------------------------------------------------
    rep(0, times=40) #vector with 40 zeros
    rep(c(0,1,2), times=10)
      rep(c(0,1,2), each=10) #repeating vector over and over again
    

# Vectors -----------------------------------------------------------------
##Creating vectors of objects c()
  #Can only have elements of the same class
    #Atomic classes: numeric, logical, character, integer, complex

    x <- c(0.5, 0.6)    #numeric
    x <- c(TRUE, FALSE) #logical
    x <- c(T, F)        #logical
    x <- c("a", "b","c") #character
    x <- 9:29           #integer
    x <- c(1+0i, 2+4i)  #complex
    
    class(x) #if several classes, find out which class

##Using the vector() function
    
    x <- vector("numeric", length=10)
    x
    
    #Collapse a vector of length 3 to length 1
    #Example
    my_char <- c("My","name","is")
    my_char
    paste(my_char, collapse=" ") #space between "" necessary
    paste("","", sep = " ") #sep with or without space 
      paste(1:3,c("X","Y","Z"), sep = "")
        #[1] "1X" "2Y" "3Z"
      paste(LETTERS, 1:4, sep = "-") #numeric vector 1:4 gets 'coerced' into a character vector by the paste function
        #"A-1" "B-2" "C-3" "D-4" "E-1" "F-2" "G-3" "H-4" ...
      
    x[c(3,5,7)] #vector of certain indexes
    x[c(-2,-10)] #vector excluding certain indexes
    x[-c(2,10)] #same result as previous
      
    #Add names to vectors
    vect1 <- c(foo = 11, bar = 2, norf = NA)
    vect2 <- c(11,2,NA)
    names(vect2) <- c("foo","bar","norf")
      identical(vect1, vect2) #check if they are identical named
      vect[c("foo","bar")] #specify vector you're interested
    
    #Giving vectors a dimension
    dim(my_vector) <- c(4,5)
    attributes(my_vector) 
      #$dim
      #[1] 4 5 
    ##--gave 'my_vector' 4 rows and 5 columns --> now it is a matrix
      #     [,1] [,2] [,3] [,4] [,5]
      #[1,]    1    5    9   13   17
      #[2,]    2    6   10   14   18
      #[3,]    3    7   11   15   19
      #[4,]    4    8   12   16   20
      
      class(my_vector) #check
        #[1] "matrix" "array" 
  

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
  #Can have elements of diff. classes
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
  
  
  ##--Giving vectors a dimension
    dim(my_vector) <- c(4,5)
    attributes(my_vector) 
      #$dim
      #[1] 4 5 
    ##--gave 'my_vector' 4 rows and 5 columns --> now it is a matrix
      #     [,1] [,2] [,3] [,4] [,5]
      #[1,]    1    5    9   13   17
      #[2,]    2    6   10   14   18
      #[3,]    3    7   11   15   19
      #[4,]    4    8   12   16   20
    
    class(my_vector) #check
    #[1] "matrix" "array" 
    
    #Adding names
    patients <- c("Bill", "Gina", "Kelly", "Sean")
    cbind(patients, my_matrix)
      #[1,] "Bill"   "1" "5" "9"  "13" "17"
      #[2,] "Gina"   "2" "6" "10" "14" "18"
      #[3,] "Kelly"  "3" "7" "11" "15" "19"
      #[4,] "Sean"   "4" "8" "12" "16" "20"
    ##--matrix with character strings --> implicit coercion - not good
      
      my_data <- data.frame(patients, my_matrix)
      my_data
      #patients X1 X2 X3 X4 X5
      #1   Bill  1  5  9 13 17
      #2   Gina  2  6 10 14 18
      #3  Kelly  3  7 11 15 19
      #4   Sean  4  8 12 16 20
        class(my_data)
          #[1] "data.frame"
      
      cnames <- c("patient","age","weight","bp","rating","test")
      colnames(my_data) <- cnames
        #  patient age weight bp rating test
        #1    Bill   1      5  9     13   17
        #2    Gina   2      6 10     14   18
        #3   Kelly   3      7 11     15   19
        #4    Sean   4      8 12     16   20
    


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
    
      x[is.na(x)] #vector of all NAs
      x[!is.na(x)] #negation "!" - everything that is not NA
        x[!is.na(x) & x > 0]
    
    ##---R represents TRUE as number 1 and FALSE as number 0
    sum() #--> gives No of 1 

# Data Frames -------------------------------------------------------------

  #Used to store tabular data - each column can be a diff. class
  #Every element on list have same length

    row.names     #attribute
    read.table()  #create frame
    read.csv()    #create  frame
    data.matrix() #convert to matrix

    x<- data.frame(foo=1:4, bar = c(T,T,F,F))
    x
      #  foo   bar
      #1   1  TRUE
      #2   2  TRUE
      #3   3 FALSE
      #4   4 FALSE
    
    nrow(x)
      #[1] 4
    ncol(x)
      #[1] 2
   
# Data types - names attribute --------------------------------------------

  #Objects - useful for writing readable code & self-describing objects
    #Example  
    x <- 1:3
    
    names(x)
      #NULL
    
    names(x) <- c("foo","bar","norf")
    x
      # foo  bar norf 
      #   1    2    3
    
    names(x)
      #[1] "foo"  "bar"  "norf"
    
  ##Lists can have names
    #Example
    x <- list(a=1,b=2,c=3)
    x
    
  ##Matrices can have names
    #Example
    m <- matrix(1:4, nrow=2, ncol=2)
    dimnames(m) <-list(c("a","b"), c("c","d"))    
    m
      #   c d
      # a 1 3
      # b 2 4

# Reading / writing data --------------------------------------------------

    #READING
    #Few principal functions
    read.table()  #reading tabular data
    read.csv()    #reading tabular data
    readLines()   #reading lines of a text file
    source        #reading in R code files (inverse of dump)
    dget          #reading R code files (inverse of dput)
    load          #reading in saved workspaces
    unserialize   #reading single R objects in binary form
    
    #WRITING
    write.table
    writeLines
    dump
    dput
    save
    serialize
    
      #Reading read.table arguments
      file              #name of file or connection
      header            #logical indicating if file has a header line (variable names)
      sep               #a string indicating how columns are separated (if separator is comma, semicolumn, tabs, space)
      colClasses        #character vector indicating the class of each column 
      nrows             #No of rows
      comment.char      #character string indicating the comment character (ex.: default Pound symbol; anything to the right of that symbol is ignored; specify other characters)
      skip              #No of lines to skip from beginning
      stringsAsFactors  #default TRUE; encode character variables as factors
      
        #Larger datasets - how much RAM is dataset using on your CPU
        comment.char = "" #leave blank if no comments are in your file
        colClasses #Specifying this option instead of using default can make the run much faster.
          col.Classes = "numeric"
            #Quick way to figure out classes
            initial <- read.table("datatable.txt", nrows=100) #nrows helps with memory usage
            classes <- sapply(initial, class) #sapply takes list, vector or data frame as input and gives output in vector or matrix
            tabAll <- read.table("datatable.txt", colClasses = classes)
              
              wc() #calculate No of lines in a file
          
        #Calculating memory requirements
          #Example
          #Data frame with 1,500,000 rows and 120 columns (all numeric)
          #1,500,00 x 120 x 8 bytes/numeric = 1,440,000,000 bytes
          #1,440,000,000 / 20^20 bytes/MB = 1,373.29 MB = 1.37 GB --> use twice as much memory to read in


      #Textual formats
      #Work much better with version control programs - GitHub
      dump & dput #preserve metadata - textual format is editable & pot. recoverable in case of corruption
      
        ##dput-ting R objects - reconstruct object with dput and reding it back in by using dget
        
        y <- data.frame(a=1,b="a")
        dput(y)
          #structure(list(a = 1, b = "a"), class = "data.frame", row.names = c(NA,-1L))
        
        structure(list(a=1,
                  b=structure(1L, .Label = "a", class="factor")),
                  .Names=c("a","b"), row.names=c(NA, -1L),
                  class="data.frame")
          #  a b
          #1 1 a
        dput(y, file="y.R")
        new.y <-dget("y.R")
        new.y
          #  a b
          #1 1 a
        
        ##Dumping R object - reconstruct multiple objects with dump and read back in using source
        
        x <- "foo"
        y <- data.frame(a=1, b="a")
        dump(c("x","y"), file="data.R")        
        rm(x,y)        
        source("data.R")        
        y      
          #  a b
          #1 1 a
        x
          #[1] "foo"

# Interfaces --------------------------------------------------------------
    
    file()    #opens connection to a file
    gzfile()  #opens connection to a file compressed with gzip
    bzfile()  #opens connection to a file compressed with bzip2
    url()     #opens connection to a webpage

    #File connections
    str(file) #str() is to display an objects internal structure
    function(description ="", open="", blocking=TRUE, 
             encoding=getOption("encoding"))
    #description is the name of the file
    #open is a code indicating:
      #"r" read only
      #"w" writing (and initializing a new file)
      #"a" appending
      #"rb"
      #"wb"
      #"ab" reading, writing or appending in binary mode
      
     #Connections - navigate files or external objects
      con <-file("foo.txt", "r")
      data <-read.csv(con)
      close(con)
      
      # --> same as data <- read.csv("foo.txt")
      #no need to use interface connection directly
      
        #can be useful when you want to read parts of a file
        con <- gzfile("words.gz")
        x <- readLines(con, 10)
        x
          writeLines() #write lines of text to a file, each character vector becomes a line
  
        
        #Reading lines of a text file
        readLines() #can be useful for reading lines of webpages
        
        con <- url("http://www.jhsph.edu","r")
        x <- readLines(con)
        head(x)
          #1] "<!DOCTYPE html>"                                               
          #[2] "<html lang=\"en\">"                                            
          #[3] ""                                                              
          #[4] "<head>"                                                        
          #[5] "<meta charset=\"utf-8\" />"                                    
          #[6] "<title>Johns Hopkins Bloomberg School of Public Health</title>"
    

# Subsetting objects ------------------------------------------------------
  #Operators that can be used to extract subsets of R objects
        
  #[] single brackets always returns object of the same class as original
  #[[]] double brackets used to extract elements of a list or data frame; can only be used to extract a single element
  #$ dolla dolla sign used to extract elements of a list or data frame by name
  
  x <- c("a","b","c","c","d","a")
  
    x[1]
      #[1] "a"
    x[2]
      #[1] "b"
    
    x[1:4]
      #[1] "a" "b" "c" "c"
    
    x[x>"a"]
      #[1] "b" "c" "c" "d"
    
    u <- x>"a"
    u
      #[1] FALSE  TRUE  TRUE  TRUE  TRUE FALSE


# Subsetting lists --------------------------------------------------------

  x <- list(foo=1:4,bar=0.6)
  
    x[1]
      #$foo
      #[1] 1 2 3 4
    
    x[[1]]
      #[1] 1 2 3 4
    
    x$bar
      #[1] 0.6
    
    x[["bar"]]
      #[1] 0.6
    
    x["bar"]
      #$bar
      #[1] 0.6
    
  #Extract multiple elements
  
  x <- list(foo=1:4, bar=0.6, baz="hello")
    #The [[]] operator can be used with computed indices; $ can only be used with literal names
    name <- "foo"
      
    x[[name]] #computed index for 'foo'
      #[1] 1 2 3 4
    
    x$name #element 'name' doesn't exist
      #NULL
    x$foo #element 'foo' does exist however
      #[1] 1 2 3 4
    
   #Subsetting nested elements
  
    x <- list(a=list(10,12,14), b=c(3.14,2.81))
    
      x[[c(1,3)]]
        #14
      
      x[[1]][[3]]
        #14
      
      x[[c(2,1)]]
        #3.14

# Subsetting matrices -----------------------------------------------------
  
  x <- matrix(1:6, 2, 3)
  x
    #     [,1] [,2] [,3]
    #[1,]    1    3    5
    #[2,]    2    4    6
  
    x[1,2]
      #[1] 3
    x[2,1]
      #[1] 2
    
    #Indices can also be missing - leave bracket empty
    
    x[1, ]
      #[1] 1 3 5
    x[ ,2]
      #[1] 3 4
    
      #By default, when a single element is retrieved as in
      x[1,2]
      #[1] 3
      #it is returned as a vector of length 1 rather than a 1 x 1 matrix
      #can be turned off by setting drop = FALSE
      x[1,2, drop=FALSE]
        #     [,1]
        #[1,]    3
    
      #Similar, subsetting a single column or a single row will give you a vector and not a matrix by default
      x[1, ]
        #[1] 1 3 5
      #can be turned off by setting drop = FALSE
      x[1, , drop=FALSE]
        #     [,1] [,2] [,3]
        #[1,]    1    3    5
      

# Subsetting partial matching ---------------------------------------------
#Partial matching of names is allowed with [[]] and $
  
  x <- list(aardvark=1:5)
      
    x$a #searches for any name containting 'a'
      #[1] 1 2 3 4 5
        
    #with [[]] different
    x[["a"]]
      #NULL
    x[["a", exact=FALSE]]
    

# Subsetting removing missing values --------------------------------------
  
  x <- c(1,2,NA,4,NA,5)
  
  bad <- is.na(x)    
  bad
    #[1] FALSE FALSE  TRUE FALSE  TRUE FALSE
  x[!bad] #!
    #[1] 1 2 4 5
  
  #Multiple vectors and multiple NAs
  
  x <- c(1,2,NA,4,NA,5)
  y <- c("a","b",NA,"d",NA,"f")  
  good <- complete.cases(x,y)
  good  
    #[1]  TRUE  TRUE FALSE  TRUE FALSE  TRUE
  
  x[good]
    #[1] 1 2 4 5
  y[good]
    #[1] "a" "b" "d" "f"

  
  ##Removing NA values
  
  airquality[1:6, ] #Space after comma - only first six rows, otherwise whole dataset if [1:6] only
    #  Ozone Solar.R Wind Temp Month Day
    #1    41     190  7.4   67     5   1
    #2    36     118  8.0   72     5   2
    #3    12     149 12.6   74     5   3
    #4    18     313 11.5   62     5   4
    #5    NA      NA 14.3   56     5   5
    #6    28      NA 14.9   66     5   6
  
  good <- complete.cases(airquality)
  airquality[good, ][1:6, ]
    #  Ozone Solar.R Wind Temp Month Day
    #1    41     190  7.4   67     5   1
    #2    36     118  8.0   72     5   2
    #3    12     149 12.6   74     5   3
    #4    18     313 11.5   62     5   4
    #7    23     299  8.6   65     5   7
    #8    19      99 13.8   59     5   8
  

# Vectorized operations ---------------------------------------------------

  x <- 1:4; y <-6:9 

  x + y
    #[1]  7  9 11 13
  x > 2
    #[1] FALSE FALSE  TRUE  TRUE
  x >= 2
    #[1] FALSE  TRUE  TRUE  TRUE
  y == 8
    #[1] FALSE FALSE  TRUE FALSE
  x * y
    #[1]  6 14 24 36
  x %*% y
    #     [,1]
    #[1,]   80
  x / y
  #[1] 0.1666667 0.2857143 0.3750000 0.4444444

  
  ##Matrix
  x <- matrix(1:4, 2, 2); y <- matrix(rep(10,4), 2, 2)
  
  x * y #element-wise multiplication  
    #     [,1] [,2]
    #[1,]   10   30
    #[2,]   20   40
  x / y
    #     [,1] [,2]
    #[1,]  0.1  0.3
    #[2,]  0.2  0.4
  
  x %*% y #true matrix multiplication
    #      [,1] [,2]
    #[1,]   40   40
    #[2,]   60   60
  
  