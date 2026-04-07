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

library(tidyverse)

# =============================================================================
# Section 1: Data Loading and Initial Preparation (factoring)
# =============================================================================

# Load the data output from Data Cleaning.rmd
train <- read.csv("data/train_cleaned.csv")
test <- read.csv("data/test_cleaned.csv")

# Comprehensive factor levels from data_description.txt
# This ensures all possible levels are present (single source of truth)
factor_levels <- list(
  MSSubClass   = c("20", "30", "40", "45", "50", "60", "70", "75", "80", "85", 
                   "90", "120", "150", "160", "180", "190"),
  MSZoning     = c("A", "C", "FV", "I", "RH", "RL", "RP", "RM"),
  Street       = c("Grvl", "Pave"),
  Alley        = c("Grvl", "Pave", "None"),
  LotShape     = c("Reg", "IR1", "IR2", "IR3"),
  LandContour  = c("Lvl", "Bnk", "HLS", "Low"),
  Utilities    = c("AllPub", "NoSewr", "NoSeWa", "ELO"),
  LotConfig    = c("Inside", "Corner", "CulDSac", "FR2", "FR3"),
  LandSlope    = c("Gtl", "Mod", "Sev"),
  Neighborhood = c("Blmngtn", "Blueste", "BrDale", "BrkSide", "ClearCr", 
                   "CollgCr", "Crawfor", "Edwards", "Gilbert", "IDOTRR", 
                   "MeadowV", "Mitchel", "Names", "NoRidge", "NPkVill", 
                   "NridgHt", "NWAmes", "OldTown", "SWISU", "Sawyer", 
                   "SawyerW", "Somerst", "StoneBr", "Timber", "Veenker"),
  Condition1   = c("Artery", "Feedr", "Norm", "RRNn", "RRAn", "PosN", "PosA", 
                   "RRNe", "RRAe"),
  Condition2   = c("Artery", "Feedr", "Norm", "RRNn", "RRAn", "PosN", "PosA", 
                   "RRNe", "RRAe"),
  BldgType     = c("1Fam", "2FmCon", "Duplx", "TwnhsE", "Twnhs"),
  HouseStyle   = c("1Story", "1.5Fin", "1.5Unf", "2Story", "2.5Fin", "2.5Unf", 
                   "SFoyer", "SLvl"),
  OverallQual  = as.character(1:10),
  OverallCond  = as.character(1:10),
  RoofStyle    = c("Flat", "Gable", "Gambrel", "Hip", "Mansard", "Shed"),
  RoofMatl     = c("ClyTile", "CompShg", "Membran", "Metal", "Roll", "Tar&Grv", 
                   "WdShake", "WdShngl"),
  Exterior1st  = c("AsbShng", "AsphShn", "BrkComm", "BrkFace", "CBlock", 
                   "CemntBd", "HdBoard", "ImStucc", "MetalSd", "Other", 
                   "Plywood", "PreCast", "Stone", "Stucco", "VinylSd", 
                   "Wd Sdng", "WdShing"),
  Exterior2nd  = c("AsbShng", "AsphShn", "BrkComm", "BrkFace", "CBlock", 
                   "CemntBd", "HdBoard", "ImStucc", "MetalSd", "Other", 
                   "Plywood", "PreCast", "Stone", "Stucco", "VinylSd", 
                   "Wd Sdng", "WdShing"),
  MasVnrType   = c("BrkCmn", "BrkFace", "CBlock", "None", "Stone"),
  ExterQual    = c("Po", "Fa", "TA", "Gd", "Ex"),
  ExterCond    = c("Po", "Fa", "TA", "Gd", "Ex"),
  Foundation   = c("BrkTil", "CBlock", "PConc", "Slab", "Stone", "Wood"),
  BsmtQual     = c("None", "Po", "Fa", "TA", "Gd", "Ex"),
  BsmtCond     = c("None", "Po", "Fa", "TA", "Gd", "Ex"),
  BsmtExposure = c("None", "No", "Mn", "Av", "Gd"),
  BsmtFinType1 = c("None", "Unf", "LwQ", "Rec", "BLQ", "ALQ", "GLQ"),
  BsmtFinType2 = c("None", "Unf", "LwQ", "Rec", "BLQ", "ALQ", "GLQ"),
  Heating      = c("Floor", "GasA", "GasW", "Grav", "OthW", "Wall"),
  HeatingQC    = c("Po", "Fa", "TA", "Gd", "Ex"),
  CentralAir   = c("N", "Y"),
  Electrical   = c("Mix", "FuseP", "FuseF", "FuseA", "SBrkr"),
  KitchenQual  = c("Po", "Fa", "TA", "Gd", "Ex"),
  Functional   = c("Sal", "Sev", "Maj2", "Maj1", "Mod", "Min2", "Min1", "Typ"),
  FireplaceQu  = c("None", "Po", "Fa", "TA", "Gd", "Ex"),
  GarageType   = c("None", "Detchd", "CarPort", "BuiltIn", "Basment", "Attchd", "2Types"),
  GarageFinish = c("None", "Unf", "RFn", "Fin"),
  GarageQual   = c("None", "Po", "Fa", "TA", "Gd", "Ex"),
  GarageCond   = c("None", "Po", "Fa", "TA", "Gd", "Ex"),
  PavedDrive   = c("N", "P", "Y"),
  PoolQC       = c("None", "Fa", "TA", "Gd", "Ex"),
  Fence        = c("None", "MnWw", "GdWo", "MnPrv", "GdPrv"),
  MiscFeature  = c("None", "Shed", "Gar2", "Othr", "TenC", "Elev"),
  SaleType     = c("WD", "CWD", "VWD", "New", "COD", "Con", "ConLw", "ConLI", 
                   "ConLD", "Oth"),
  SaleCondition = c("Normal", "Abnorml", "AdjLand", "Alloca", "Family", "Partial"),
  MoSold       = as.character(1:12),
  YrSold       = c("2006", "2007", "2008", "2009", "2010")
)

# Convert all variables to factors using the explicit levels from the dictionary
train <- train |>
  mutate(
    across(
      all_of(names(factor_levels)),
      ~factor(.x, levels = factor_levels[[cur_column()]])
    )
  )

test <- test |>
  mutate(
    across(
      all_of(names(factor_levels)),
      ~factor(.x, levels = factor_levels[[cur_column()]])
    )
  )

# =============================================================================
# Section 2: Identify Constants, Sequential or collinear variables for removal
# =============================================================================

# Constants and sequential/irrelevant columns
Removed <- c("Id")  # sequential, no predictive value
# YearRemodAdd is perfectly collinear with YearBuilt in this dataset
if ("YearRemodAdd" %in% names(train)) Removed <- c(Removed, "YearRemodAdd")

# Drop identified columns from both datasets
train <- train |> select(-any_of(Removed))
test  <- test  |> select(-any_of(Removed))

# =============================================================================
# Section 3: Feature Engineering & Selection (expand here as modeling proceeds)
# =============================================================================

# use engineered_train and engineered_test for feature engineering and selection steps to avoid confusion with raw train/test datasets

