# Housing Prices Advanced Regression Analysis

**MSDS 6371 - Statistical Foundations for Data Science**  
**Southern Methodist University**  

This repository contains the work for the final project in MSDS 6371, using the [Kaggle House Prices: Advanced Regression Techniques](https://www.kaggle.com/c/house-prices-advanced-regression-techniques) dataset. The project demonstrates modern statistical modeling techniques with a focus on **multiple linear regression**, assumption checking, influential point analysis, feature engineering (including interactions and transformations), and predictive performance evaluation.

## Project Overview

The Kaggle dataset includes 79 explanatory variables describing residential homes in Ames, Iowa, sold between 2006 and 2010. Our analyses address two distinct business and predictive questions:

## Project Status

| Pipeline Step              | Status     | Details                                      |
|---------------------------|------------|----------------------------------------------|
| Data Loading               | ✅ Complete | Both `train.csv` and `test.csv` loaded       |
| Data Cleaning (Training)   | ✅ Complete | `train_cleaned.csv` created and saved        |
| Data Cleaning (Test)       | 🔄 In Progress | 12 rows still contain NAs in `df_test_clean` |
| Exploratory Data Analysis  | ✅ Complete | Analysis 1 (Century 21) + Shiny app done     |
| Feature Engineering        | 🔄 In Progress | Transformations and imputations ongoing      |
| Modeling (Multiple LR)     | 🔄 In Progress | Building and comparing candidate models      |
| Model Diagnostics          | ⏳ Not Started | Residual analysis, influential points, etc.  |
| Prediction & Submission    | ⏳ Not Started | Blocked by test set cleaning                 |
| Final Report & Documentation | 🔄 In Progress | Report in progress                           |

**Current Focus**: Finishing test data cleaning and building the predictive multiple linear regression model (Analysis 2).

### Analysis 1: Client-Focused Regression for Century 21 Ames
Century 21 Ames sells homes only in the **NAmes**, **Edwards**, and **BrkSide** neighborhoods. We investigated the relationship between **SalePrice** and living area (**GrLivArea**, scaled in 100 sq. ft. increments as preferred by realtors) and whether this relationship differs by neighborhood.

- **Model**: Multiple linear regression with interaction terms (GrLivArea × Neighborhood).
- Deliverables include parameter estimates, confidence intervals, residual diagnostics, Cook's D / leverage analysis for influential observations, and a clear interpretation for the client.
- **RShiny App**: Interactive visualization of SalePrice vs. GrLivArea (filterable by neighborhood).  
  → Live app: [https://powellonpoint.shinyapps.io/Ames_Iowa_Housing_Sales_EDA_2006-2010/](https://powellonpoint.shinyapps.io/Ames_Iowa_Housing_Sales_EDA_2006-2010/)

### Analysis 2: Predictive Modeling for All of Ames, Iowa
We built and compared multiple linear regression models (limited to techniques covered in MSDS 6371) to predict **SalePrice** across all neighborhoods:

- **Candidate Models**:
  - Simple Linear Regression (SLR) – one explanatory variable.
  - Multiple Linear Regression (MLR1) – `SalePrice ~ GrLivArea + FullBath`.
  - Additional MLR model(s) with feature selection, transformations, and interactions.

- **Evaluation Metrics**: Adjusted R², CV PRESS, AIC, and public Kaggle score (RMSE on log(SalePrice)).
- The best model was selected based on predictive performance and submitted to Kaggle.

## Repository Structure

```
Housing-Prices-Regression/
├── data/
│   ├── train.csv                  # Training data with SalePrice (1460 obs)
│   ├── test.csv                   # Test data for Kaggle submission (1459 obs)
│   └── sample_submission.csv      # Kaggle submission template
├── code/
│   ├── Data Cleaning.rmd.         # Notes and steps producing train_cleaned.csv and test_cleaned.csv
│   ├── analysis1_century21.R      # Analysis 1: Neighborhood-specific regression
│   ├── analysis2_predictive.R     # Analysis 2: Competing predictive models
│   └── Executive_Summary.R
├── shiny_app/                     # RShiny interactive dashboard
│   ├── app.R                      # Base app
│   └── chart_functions.R.         # Helper functions
│   └── data_descriptions.txt
├── MSDS6371_Final_Project_Report.pdf   # Main paper
├── appendix_code.pdf              # Full commented code
├── README.md
├── LICENSE
```

## Key Techniques Demonstrated
- Data cleaning and exploratory data analysis (EDA)
- Variable transformations and interaction terms
- Model diagnostics: residual plots, normality, homoscedasticity, linearity
- Influential point analysis (Cook's Distance, leverage)
- Cross-validation (PRESS statistic)
- Predictive performance on unseen data via Kaggle submission

All analyses were performed in **R** Full, well-commented code is available in the repository (and included in the project appendix).

## Results Summary (TBD)

## Deliverables
- **Written Report**: PDF (Introduction, Data Description, Analysis 1, Analysis 2, Conclusion, Appendix with code).
- **RShiny App**: Interactive exploration of price vs. living area.
- **Kaggle Submission**: Generated from the best model.
- **GitHub Pages** (optional but encouraged): Link to your portfolio site with this project.

## Technologies
- **Language**: R (100%)
- **Tools**: RStudio, `ggplot2`, `shiny`, `dplyr`, `lm()`, `influence.measures()`, `x.Ai API`
- **License**: MIT

## How to Reproduce
1. Clone the repository: `git clone https://github.com/PowellOnPoint/Housing-Prices-Regression.git`
2. Open the R scripts or SAS programs in the `code/` folder.
3. Run the Shiny app locally from the `Rshiny EDA/` directory.
4. The project paper contains full details and interpretations.

## Authors
- Aaron Powell – MSDS Candidate, Southern Methodist University  
- Joshua Samuel – MSDS Candidate, Southern Methodist University  

## Acknowledgments
- Course instructors: Dr. Bivin Sadler and Dr. Monnie McGee
- Dataset: Kaggle House Prices: Advanced Regression Techniques
- Special thanks to the SMU MSDS program for the rigorous statistical foundation provided in MSDS 6371.