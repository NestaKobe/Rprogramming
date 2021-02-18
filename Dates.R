library(swirl)
install_from_swirl("Getting and Cleaning Data")
swirl()


# DATES -------------------------------------------------------------------
library(lubridate)

this_day <- today()
this_day

  year(this_day)
  month(this_day)
  day(this_day)
  
  wday(this_day)
  [1] 4 #Wednesday --> Sunday = 1
  
    wday(this_day, label = TRUE)
    #[1] Wed
    #Levels: Sun < Mon < Tue < Wed < Thu < Fri < Sat
    
  
this_moment <- now()  
this_moment

  year(this_moment)
  month(this_moment)
  day(this_moment)
  
  hour(this_moment)
  minute(this_moment)
  second(this_moment)
  


# Parsing date-times ------------------------------------------------------
#Lubridate() offers a variety of functions
ymd()
dmy()
hms()
ymd_hms() #etc.

#--> years (y), months (m), days(d) etc.

  my_date<- ymd("1989-05-17") #ymd takes character string and returns an object of clas POSIXct
  my_date  
  
  class(my_date)

  ymd("1989 May 17")
    #[1] "1989-05-17"
  
  mdy("March 12, 1975")
    #[1] "1975-03-12"

  dmy("25081985")
    #[1] "1985-08-25"
  
  ymd("192012")
    #1] NA
  
    ymd("1920/1/2")
      #[1] "1920-01-02"
  
  
  dt1
    #[1] "2014-08-23 17:23:02"
    
  ymd_hms(dt1)
    #[1] "2014-08-23 17:23:02 UTC"
  
  #"03:22:14" (hh:mm:ss)
  hms("03:22:14")
    #[1] "3H 22M 14S"
  
  dt2
    #[1] "2014-05-14" "2014-09-22" "2014-07-11"
  
  ymd(dt2)

  
  #current time is 08:34:55 (hh:mm:ss)
  update(this_moment, hours = 8, minutes = 34, seconds = 55)
    #2021-01-13 08:34:55 CET"
  
  this_moment <- update(this_moment, hours = 10, minutes = 16, seconds = 0)
  this_moment  

  ?now
  nyc <- now("America/New_York")  
  # http://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  
  nyc  
  
    depart <- nyc + days(2)  
    depart <- update(depart, hours = 17, minutes = 34)
    depart
      #[1] "2021-01-15 17:34:50 EST"
    
    arrive <- depart + hours(15) + minutes(50)
    arrive
    
    ?with_tz
    
    arrive <- with_tz(arrive, "Asia/Hong_Kong")
      #[1] "2021-01-16 22:24:50 HKT"
    
    
    last_time <- mdy("June 17, 2008", tz = "Singapore")
    last_time
    
    how_long <- interval(last_time, arrive)
    as.period(how_long)
    
    
  stopwatch() #to see how long I was working :P
    #[1] "36M 58.3118100166321S"

# Four classes of time related objects ------------------------------------

instants()
intervals()
durations()
periods()

        