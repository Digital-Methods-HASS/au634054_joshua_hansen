install.packages("gapminder")

library(gapminder)

head(gapminder)

calc_GDP_by_year_country <- function(dat, year=NULL, country=NULL) { # here we create a function called calcGDP, with 3 parameters, where country and year are set to default as null.
  if(!is.null(year)) { # i.e. : if the parameter year is not null (is filled out), check for that year in the data and return a subset of the dataset.
    dat <- dat[dat$year %in% year, ] # %in% checks if the year given is included in the dataframe
  }
  if (!is.null(country)) { # if the country parameter is not null, check for the country in DF and return a subset
    dat <- dat[dat$country %in% country,]
  }
  gdp <- dat$pop * dat$gdpPercap # for the gdp you have to take the population times the gdp per capita (the gdp of a citizen times population = overall gdp)
  
  new <- cbind(dat, gdp=gdp) # cbind means column-bind and puts the calculated gdp as a new column in the dataset
  return(new) # we return the updated dataset with the gdp column
}

calcGDP(gapminder, country="Denmark") # here I call the function with the gapminder data, and the country set to Denmark





low_exp <- 50 # here we create a threshold of the low life expectancy, that makes it easier to refer to in the control flow
high_exp <- 70

candidateCountries <- grep("^B", unique(gapminder$country), value = TRUE) # here we pick all the countries that starts with a "B" using the grepl function

for (country in candidateCountries) { #here we start to loop over the countries starting with "B"

    tmp <- gapminder[gapminder$country == country, ] # we are specifying, that the country we want the mean lifeExp of, is the current country we iterate
    average_exp <- mean(tmp$lifeExp, na.rm = TRUE) # here we calc. the mean of lifeExp for the country we iterate over
   
  
  if(average_exp < low_exp) { # if the average life expectancy is lower than 50, print out the expectancy
    cat("the average life expectancy in", country, "is less than", low_exp, "\n")
  } else if(average_exp > low_exp && average_exp < high_exp) {
    cat("the average life expectancy in", country, "is between", low_exp, "and", high_exp, "\n")
  } else {
    cat("the average life expectancy in", country, "is greater than", high_exp, "\n")
  }

  rm(average_exp) # we are removing the tmp after each iteration, to create the average lifeExp for the next country
}
  




