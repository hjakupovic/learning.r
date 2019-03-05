# when gender is *not* equal to
NHANES %>%
  filter(Gender != "female")

NHANES %>%
  filter(Gender != "female")

# when BMI is equal to
NHANES %>%
  filter(BMI == 25)

# when BMI is equal to or more than
NHANES %>%
  filter(BMI >= 25)

# when BMI is 25 *and* Gender is female
NHANES %>%
  filter(BMI == 25 & Gender == "female")

# when BMI is 25 *or* gender is female
NHANES %>%
  filter(BMI == 25 | Gender == "female")


# arrange(): Sorting/(re)arranging your data by column --------------------

# ascending order by age
NHANES %>%
  arrange(Age) %>%
  select(Age)


# Other arrange (for reference)
# descending order by rate
NHANES %>%
  arrange(desc(Age)) %>%
  select(Age)

# ascending order by Age and Gender
NHANES %>%
  arrange(Age, Gender) %>%
  select(Age, Gender)

