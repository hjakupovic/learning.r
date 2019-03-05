source(here::here("R/package-loaging.R"))


# notes

#object assignment
weight_kilos <- 100
weight_kilos

#vector
c("a", "b")
c(1, 2)
1:10


#dataframe
head(iris)

# data wrangling ----------------------------------------------------------


colnames(iris)
str(iris)
str(weight_kilos)
summary(iris)



# make code more readable-------------------------------------------------# Object names
#reformat the code with CTRL + Shift + A or "Code -> Reformat Code"

#DayOne
Day_one <- DayOne
#dayone
day_one

T <- FALSE
#better as
false <- FALSE

#because c is already a function here, no need to replace c with 9
c <- 9
mean <- function(DayOne)
  sum("c")

# Spacing

x[, 1]
mean (x, na.rm = TRUE)

function(x) {
}
height <- feet * 12 + inches
mean(x, na.rm = 10)
sqrt(x ^ 2 + y ^ 2)
df$z
x <- 1:10

# Indenting
if (y < 0 && debug)
  message("Y is negative")

sd

summing <- function(a, b) {
  add_numbers <- a + b
  return(add_numbers)
}
summing(2, 2)


write.csv(iris, here::here("data/iris.csv"))

iris_data <- read.csv(here::here("data/iris.csv"))
head(iris_data)
?write_csv

