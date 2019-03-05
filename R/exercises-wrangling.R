source(here::here("R/package-loaging.R"))

# Load the packages
library(tidyverse)
library(NHANES)

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

#standart R way of chaining the functions
colnames(NHANES)
NHANES %>% colnames()

#pipe way of chaining
glimpse(head(NHANES))
NHANES %>%
  head %>%
  glimpse()


# mutate() function ---------------------------------------------------------
# Modify an existing variable
NHANES %>%
  mutate(Height = Height / 100)

#if you want to save the change:
NHANES_changed <- NHANES %>%
  mutate(Height = Height / 100)

# if you want to save the change as new variable:
NHANES_changed <- NHANES %>%
mutate(Height_meters = Height / 100)

#check if there
str(NHANES_changed$Height_meters)

#create a new variable based on a condition
NHANES_changed <- NHANES_changed %>%
  mutate(HighlyActive = if_else(PhysActiveDays >= 5, "yes", "no"))

#create or replace multiple variables by using ","
NHANES_changed <- NHANES_changed %>%
  mutate(new_column = "only one variable",
         Height = Height/100,
         UrineVolAverage = (UrineVol1 + UrineVol2)/2)


# exercide 2 piping transforming and adding -------------------------------

# Check the names of the variables
colnames(NHANES)

# Pipe the data into mutate function and:
NHANES_modified <- NHANES %>% # dataset
  mutate(# 1. Calculate average urine volume
    UrineVolAverage = (UrineVol1 + UrineVol2) / 2,
    # 2. Modify Pulse variable
    Pulse = Pulse / 60,
    # 3. Create YoungChild variable using a condition
    YoungChild = if_else(Age < 6, TRUE, FALSE))
NHANES_modified


# select() Select specific data by the variable ---------------------------
# Select columns/variables by name, without quotes
NHANES %>%
  select(Age, Gender, BMI)

# To *not* select a variable, us minus (-)
NHANES %>%
  select(-HeadCirc)

# When you have many variables with similar names, use "matching" functions
NHANES %>%
  select(starts_with("BP"), contains("Vol"))

?select_helpers


# rename(): Rename specific columns ---------------------------------------
# rename using the form "newname = oldname" - this is not saving the new name!!! you need to do it by assigning the new dataframe
NHANES %>%
  rename(NumberBabies = nBabies)

# filter(): Filtering/subsetting the data by row --------------------------
# when gender is equal to
NHANES %>%
  filter(Gender == "female")

################################

# To see values of categorical data
summary(NHANES)

# 1. BMI between 20 and 40 and who have diabetes
NHANES %>%
  # format: variable >= number
  filter(BMI >= 20 & BMI <= 40 & Diabetes == TRUE )

# 2. Working or renting, and not diabetes
NHANES %>%
  filter(Work == TRUE | HomeOwn == TRUE & Diabetes == FALSE ) %>%
  select(Diabetes, HomeOwn, Work, Age, Gender)

# 3. How old is person with most number of children.
NHANES %>%
  arrange(desc(nBabies)) %>%
  select(Age, nBabies)

NHANES %>%
  summarize(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))
