# LOAD DATASETS PACKAGES ####################################

library(datasets)

# LOAD DATA #################################################

?mtcars
head(mtcars)

# BAR CHARTS ################################################

barplot(mtcars$cyl)    # Doesn't work

# Need a table with frequencies for each category
cylinders <- table(mtcars$cyl)    # Create table
barplot(cylinders)                # Bar chart
plot(cylinders)                   # Default X-Y plot (lines)

# CLEAN UP ##################################################

# Clear environment
rm(list=ls())
