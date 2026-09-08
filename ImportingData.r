# INSTALL AND LOAD PACKAGES #####################

# Packages to load; uses "pacman"
pacman::p_load(
    pacman, dplyr, GGally, ggplot2, ggthemes,
    ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny,
    stringr, tidyr
)

# ABOUT EXCEL FILES #############################

# From the official R documentation
browseURL("http://j.mp/2aFZUrJ")

# You have been warned...

# IMPORTING WITH RIO ############################

# CSV
rio_csv <- import("./ImportingData_Datasets/mbb.csv")
head(rio_csv)

# TXT
rio_txt <- import("./ImportingData_Datasets/mbb.txt")
head(rio_txt)

# Excel XLSX
rio_xlsx <- import("./ImportingData_Datasets/mbb.xlsx")
head(rio_xlsx)

# DATA VIEWER ###################################

?View
View(rio_csv)

# READ.TABLE FOR TXT FILES ######################

# R's built-in function for text files (used by rio)

# TEXT FILES

# Load a spreadsheet that has been saved as tab-delimited
# text file. Need to give complete address to file. This
# command gives an error on missing data but works on
# complete data.
r_txt1 <- read.table("./ImportingData_Datasets/mbb.txt", header=TRUE)

# This works with missing data by specifiying the separator:
# \t is for tabs, sep="," for commas. R converts missing
# to "NA"
r_txt2 <- read.table(
    "./ImportingData_Datasets/mbb.txt",
    header=TRUE,
    sep="\t"
)

# READ.CSV FOR CSV FILES ########################

# R's built in function for csv files (also used by rio)

# CSV FILES
# Don't have to specify delimiters for missing data
# because CSV means "comma seperated values"
trends.csv <- read.csv("./ImportingData_Datasets/mbb.csv", header=TRUE)

# CLEAN UP ######################################

# Clear environment
rm(list=ls())
