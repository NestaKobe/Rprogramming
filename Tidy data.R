library(swirl)
install_from_swirl("Getting and Cleaning Data")
swirl()


# TIDY DATA ---------------------------------------------------------------
#Tidy data is formatted in a standard way that facilitates exploration and analysis 
#and works seamlessly with other tidy data tools. 
#Specifically, tidy data satisfies three conditions:
  # 1) Each variable forms a column
  # 2) Each observation forms a row
  # 3) Each type of observational unit forms a table


library(readr)
library(tidyr)
library(dplyr)

students
  #grade male female
  #1     A    5      3
  #2     B    4      1
  #3     C    8      6
  #4     D    4      5
  #5     E    5      5

  gather(students, sex, count,-grade) #-grade --> gather all columns EXCEPT the grade column
    #   grade    sex count
    #1      A   male     5
    #2      B   male     4
    #3      C   male     8
    #4      D   male     4
    #5      E   male     5
    #6      A female     3
    #7      B female     1
    #8      C female     6
    #9      D female     5
    #10     E female     5

students2
  #  grade male_1 female_1 male_2 female_2
  #1     A      7        0      5        8
  #2     B      4        0      5        8
  #3     C      7        4      5        6
  #4     D      8        2      8        1
  #5     E      8        4      1        0
  
  res <- gather(students2, sex_class, count, -grade)
  res
    #   grade sex_class count
    #1      A    male_1     7
    #2      B    male_1     4
    #3      C    male_1     7
    #..
    
    separate(data=res, col=sex_class, into = c("sex", "class")) #separates non-alphanumeric values --> _
      #   grade    sex class count
      #1      A   male     1     7
      #2      B   male     1     4
      #3      C   male     1     7
    
  
    #SIMPLYFY
    students2 %>%
      gather(sex_class, count, -grade) %>%
      separate(sex_class, c("sex", "class")) %>% 
      print
    
students3
#    name    test class1 class2 class3 class4 class5
#1  Sally midterm      A   <NA>      B   <NA>   <NA>
#2  Sally   final      C   <NA>      C   <NA>   <NA>
#3   Jeff midterm   <NA>      D   <NA>      A   <NA>
  
  students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  print
  #n   name    test  class grade
  #1  Sally midterm class1     A
  #2  Sally   final class1     C
  #9  Brian midterm class1     B

  students3 %>%
    gather(class, grade, class1:class5, na.rm = TRUE) %>%
    spread(test, grade) %>%
    print
    #    name  class final midterm
    #1  Brian class1     B       B
    #2  Brian class5     C       A
    #3   Jeff class2     E       D
  
  #Parse number
  students3 %>%
    gather(class, grade, class1:class5, na.rm = TRUE) %>%
    spread(test, grade) %>%
    mutate(class = parse_number(class)) %>% #parse_number function mutates class1 into 1
    print

students4
  #    id  name sex class midterm final
  #1  168 Brian   F     1       B     B
  #2  168 Brian   F     5       A     C
  #3  588 Sally   M     1       A     C
  #4  588 Sally   M     3       B     C

  student_info <- students4 %>%
    select(id, name, sex) %>%
    unique %>% #filters for double rows
    print
      #   id  name sex
      #1 168 Brian   F
      #3 588 Sally   M
      #5 710  Jeff   M
      #7 731 Roger   F
      #9 908 Karen   M
  
  gradebook <- students4 %>%
    print
      #    id class midterm final
      #1  168     1       B     B
      #2  168     5       A     C
  

##Single observational unit stored in multiple tables

passed
  #name class final
  #1 Brian     1     B
  #2 Roger     2     A
  #3 Roger     5     A
  #4 Karen     4     A

failed
  #name class final
  #1 Brian     5     C
  #2 Sally     1     C
  #3 Sally     3     C
  #4  Jeff     2     E
  #5  Jeff     4     C
  #6 Karen     3     C

passed <- mutate(passed, status = "passed") 
  passed <- passed %>% mutate(status="passed")

failed <- failed %>% mutate(status="failed")

bind_rows(passed, failed)

#Example SAT - exam

sat
  # A tibble: 6 x 10
  #  score_range read_male read_fem read_total math_male math_fem math_total write_male write_fem write_total
  #  <chr>           <int>    <int>      <int>     <int>    <int>      <int>      <int>     <int>       <int>
  #1 700-800         40151    38898      79049     74461    46040     120501      31574     39101       70675
  #2 600-690        121950   126084     248034    162564   133954     296518     100963    125368      226331
  #3 500-590        227141   259553     486694    233141   257678     490819     202326    247239      449565
  #4 400-490        242554   296793     539347    204670   288696     493366     262623    302933      565556
  #5 300-390        113568   133473     247041     82468   131025     213493     146106    144381      290487
  #6 200-290         30728    29154      59882     18788    26562      45350      32500     24933       57433

  sat %>%
    select(!contains("total")) %>%
    gather(part_sex, count , -score_range) %>%
    separate(part_sex, c("part", "sex")) %>%
    print
      # A tibble: 36 x 4
      #score_range part  sex    count
      #  <chr>       <chr> <chr>  <int>
      #1 700-800     read  male   40151
      #2 600-690     read  male  121950
  
  sat %>%
    select(-contains("total")) %>%
    gather(part_sex, count, -score_range) %>%
    separate(part_sex, c("part", "sex")) %>%
    group_by(part, sex) %>%
    mutate(total = sum(count), prop = count / total) %>% 
    print
      #score_range  part  sex    count  total   prop
      # <chr>       <chr> <chr>  <int>  <int>  <dbl>
      #1 700-800     read  male   40151 776092 0.0517
      #2 600-690     read  male  121950 776092 0.157 
      #3 500-590     read  male  227141 776092 0.293
  
  

# Editing text variables --------------------------------------------------

#Fixing character vectors
tolower() #making all variables lowercase
toupper() #
strsplit() #if column name is for ex. "Location.1" --> splitNames <- strsplit(column(dataset), "\\.") to exclude "."
  sapply()
    #firstElement <- function(x){x[1]}
    #sapply(splitNames, firstElement) --> "Location.1" becomes "Location"
sub() #if a header is for ex. "solution_id" --> sub("_","", names(dataset),)
  testName <- "this_is_a_test"
    sub("_","",testName,)  
      #[1] "thisis_a_test"
gsub()
      gsub("_","",testName)
        #[1] "thisisatest"

#Finding values
grep() #grep("XYZ", dataset$column)
grepl()


#More useful string functions
library(stringr)

nchar("Simon Coburg")
  #[1] 12
  nchar("Simon von Sachsen-Coburg und Gotha")
    #[1] 34

substr("Simon Coburg", 1,7)
  #[1] "Simon C"

paste("Simon", "Coburg")
  #[1] "Simon Coburg"
  paste0("Simon","Coburg")
    #[1] "SimonCoburg"
  
str_trim("Simon        ")  
  #[1] "Simon"
  