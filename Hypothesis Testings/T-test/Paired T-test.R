before <- c(21,35,40,38,23,27,28,39,22,35,28,20,39,28,34) #mood rating before the instument was introduced
after <- c(32,35,38,57,37,30,39,28, 40,48,33,33,39,41,40) # mood after musical instument has been introduced

result <- t.test(after,before, alternative="greater",paired=TRUE) # running the t-test for paired values
result #printing out the result in console
