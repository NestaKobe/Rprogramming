#JohnHopkins University course in RProgramming with Dr Roger Peng

#Profiling

system.time()
#takes arbitrary R expression as input and return the amount of time taken
#to evaluate te expression
#Computes time needed to execute an expression in seconds
  #IF there's an error, gives time until error occured

#Returns an object of class proc_time
  #user time: time charged to the CPU for this expression
  #elapsed time: "wall clock" time

Rprof()
summarRprof() 
#summarizes the output from Rprof() - otherwise it's not readable
#keeps track of the function call stack at regularly stamped intervals and
#tabulates how much time is spend in each function

#Two methods normalizing the data
by.total() #divides the time spend in each function by the total run time
by.self() #does the same but first substracts out time spent in functions above in the call stack

#DO NOT USE system.time() and Rprof() together

