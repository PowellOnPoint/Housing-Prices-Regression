# =============================================================================
# This module performs data preparation for linear regression
# It is sourced by:
#  Analysis2_predictive.rmd
#  Analysis1_century21.rmd

# Data Cleaning.rmd handles missing values and outliers, this module focuses:
# 1. Converting character variables to factors
# 2. Removing constants and sequential variables
# 3. Removing highly collinear variables for Multiple Linear Regression
# In pursuit of reducing inconsistencies between group members and analysis. 
# =============================================================================

# Load necessary libraries
library(tidyverse)

# =============================================================================
# Section 1: Data Loading and Initial Preparation (factoring)
# =============================================================================

# Load the data output from Data Cleaning.rmd
train <- read.csv("data/train_cleaned.csv")
test <- read.csv("data/test_cleaned.csv")

ToFactor <- c(
  "MSSubClass", "MSZoning", "Street", "Alley", "LotShape", "LandContour",
  "Utilities", "LotConfig", "LandSlope", "Neighborhood", "Condition1",
  "Condition2", "BldgType", "HouseStyle", "OverallQual", "OverallCond",
  "RoofStyle", "RoofMatl", "Exterior1st", "Exterior2nd", "MasVnrType",
  "ExterQual", "ExterCond", "Foundation", "BsmtQual", "BsmtCond",
  "BsmtExposure", "BsmtFinType1", "BsmtFinType2", "Heating", "HeatingQC",
  "CentralAir", "Electrical", "KitchenQual", "Functional", "FireplaceQu",
  "GarageType", "GarageFinish", "GarageQual", "GarageCond", "PavedDrive",
  "PoolQC", "Fence", "MiscFeature", "SaleType", "SaleCondition",
  "MoSold", "YrSold"
)

# Convert to factors (train first, then align test levels to train)
train <- train |>
  mutate(across(all_of(intersect(cols_to_factor, names(train))), as.factor))

test <- test |>
  mutate(across(all_of(intersect(cols_to_factor, names(test))), 
                ~factor(.x, levels = levels(train[[cur_column()]]))))

# =============================================================================
# Section 2: Identify Constants, Sequential, and Near-Zero-Variance Variables
# =============================================================================

# Constants and sequential/irrelevant columns
ToRemove <- c("Id")  # sequential, no predictive value
# YearRemodAdd is perfectly collinear with YearBuilt in this dataset
if ("YearRemodAdd" %in% names(train)) ToRemove <- c(ToRemove, "YearRemodAdd")

# Simple near-zero-variance check
nzv_check <- train |>
  select(where(is.numeric)) |>
  summarise(across(everything(), ~length(unique(.x)))) |>
  pivot_longer(everything(), names_to = "var", values_to = "unique_vals") |>
  filter(unique_vals <= 2)  # very low variety

# Drop identified columns from both datasets
train <- train |> select(-any_of(ToRemove))
test  <- test  |> select(-any_of(ToRemove))

# Gather constant or sequential variables
Remove <- sapply(train, function(x) length(unique(x)) == 1) # no constants
Remove["Id"] <- TRUE # sequential variable that won't help with prediction

# =============================================================================
# Section 3: Feature Engineering & Selection (expand here as modeling proceeds)
# =============================================================================

# use engineered_train and engineered_test for feature engineering and selection steps to avoid confusion with raw train/test datasets

