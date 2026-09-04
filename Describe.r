# INSTALL AND LOAD PACKAGES ########################

options(timeout = 300)
options(repos = c(CRAN = "https://cloud.r-project.org"))
install.packages("plotly")

# Packages to load; uses "pacman"
pacman::p_load(
    pacman, dplyr, GGally, ggplot2, ggthemes,
    ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny,
    stringr, tidyr
)

library(datasets)    # Load/unload base packages manually

# LOAD DATA ########################################

head(iris)

# PSYCH PACKAGE ####################################
library(pacman)

# Load psych package (download if needed)
p_load(psych)

# Get info on package
help(package = "psych")    # Opens package PDF in browser
p_help(psych, web=F)       # Opens help in R Viewer

# DESCRIBE() #######################################

# For quantitative variables only.

describe(iris$Sepal.Length)    # One quantitative variable
describe(iris)                 # Entire data frame

# CLEAN UP #########################################

# Clear environment
rm(list=ls())
