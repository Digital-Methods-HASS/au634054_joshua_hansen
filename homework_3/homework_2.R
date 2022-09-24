#1) Use R to figure out how many elements in the vector below are greater than 2 and then tell me what their sum (of the larger than 2 elements) is.



library(tidyverse)



# here I assign the data in a vector vector
rooms <- c(1, 2, 4, 5, 1, 3, 1, NA, 3, 1, 3, 2, 1, NA, 1, 8, 3, 1, 4, NA, 1, 3, 1, 2, 1, 7, 1, 9, 3, NA) 

# omitting missing values

#rooms <- na.omit(rooms) #- could also use this
rooms <- rooms[!is.na(rooms)]


# define vector with values > 2
two_rooms <- rooms[rooms > 2]

# finding the length of the vector - length = amount of rooms that are left with more than two rooms
length(two_rooms)

# here im taking the sum of this vector
sum(two_rooms)


##There are 12 number with a value > 2 and their sum is in total 55


class(rooms)

dir.create("homework_2")
