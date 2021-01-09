#JohnHopkins University course in RProgramming with Dr Roger Peng

#Looking at datasets; checking datasets

ls() #list variables in workspace

class() #overall structure of the data
  #[1] "data.frame"

dim() #data.frame --> two dimensions (row and columns); how many?
  nrow() #
  ncol() #
  
object.size() #how much space is the dataset occupying in memory

names() #returns a character vector of column names

head() #preview top of the dataset
  head("argument", 10) #show first 10 rows of dataset
  
tail() #preview the end of the dataset
  tail("argument", 15) #show last 15 rows of dataset

summary() #how each variable is distributed and how much of a dataset is missing

table("Argument"$"Column")

str() #Structure of data


# Graphics ----------------------------------------------------------------

plot() #scatterplot

  xlab(), ylab() #Axis titles
  main(), sub() #Title, subtitle
  col() #colour
  pch() #shape
  
  xlim(a,b), ylim(a,b) #Limit to a certain length


boxplot()
  data(mtcars)
  boxplot(mpg ~cyl, data = mtcars) #"~" indicates relationship between input variables
  

hist()
  data(mtcars)
  hist(mtcars$mpg)
  
    colMeans()
    hist(colMeans())

#base graphics
    url(https://www.ling.upenn.edu/~joseff/rstudy/week4.html)


