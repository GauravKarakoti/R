# INSTALL AND LOAD PACKAGES ######################

# Packages to load; uses "pacman"
pacman::p_load(
    pacman, dplyr, GGally, ggplot2, ggthemes,
    ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny,
    stringr, tidyr
)

library(datasets)    # Load base packages manually

# LOAD DATA ######################################

?USJudgeRatings
head(USJudgeRatings)
data <- USJudgeRatings

# Define variable groups
x <- as.matrix(data[-12])
y <- data[, 12]

# REGRESSION WITH SIMULTANEOUS ENTRY #############

# Using variable groups
reg1 <- lm(y ~ x)

# Or specify variables individually
reg1 <- lm(
    RTEN ~ CONT + INTG + DMNR + DILG + CFMG +
    DECI + PREP + FAMI + ORAL + WRIT + PHYS,
    data=USJudgeRatings
)

# Results
reg1             # Coefficients only
summary(reg1)    # Inferential tests

# MORE SUMMARIES #################################

anova(reg1)              # Coefficients w/inferential tests
coef(reg1)               # Coefficients (same as reg1)
confint(reg1)            # CI for coefficients
resid(reg1)              # Residuals case-by-case
hist(residuals(reg1))    # Histogram of residuals

# ADDITIONAL MODELS ##############################

# Use two additional libraries
p_load(lars, caret)

# Conventional stepwise regression
stepwise <- lars(x, y, type="stepwise")

# Stagewise: Like stepwise but with better generalizability
forward <- lars(x, y, type="forward.stagewise")

# LAR: Least Angle Regression
lar <- lars(x, y, type="lar")

# LASSO: Least Absolute Shrinkage and Selection Operator
lasso <- lars(x, y, type="lasso")

# Comparison of R^2 for new models
r2comp <- c(
    stepwise$R2[6], forward$R2[6],
    lar$R2[6], lasso$R2[6]
) %>% round(2)
names(r2comp) <- c("stepwise", "forward", "lar", "lasso")
r2comp    # Show values of R^2

# CLEAN UP #######################################

# Clear environment
rm(list=ls())
