# Housing Prices Advanced Regression Analysis

**MSDS 6371 - Statistical Foundations for Data Science**  
**Southern Methodist University**  

This repository contains the work for the final project in MSDS 6371, using the [Kaggle House Prices: Advanced Regression Techniques](https://www.kaggle.com/c/house-prices-advanced-regression-techniques) dataset. The project demonstrates modern statistical modeling techniques with a focus on **multiple linear regression**, assumption checking, influential point analysis, feature engineering (including interactions and transformations), and predictive performance evaluation.

Checkout the [Live app:/](https://powellonpoint.shinyapps.io/Ames_Iowa_Housing_Sales_EDA_2006-2010/)

## Project Overview

The Kaggle dataset includes 79 explanatory variables describing residential homes in Ames, Iowa, sold between 2006 and 2010. Our analyses address two distinct business and predictive questions:

## Project Status

| Step | Pipeline Stage                              | Status      | Notes / Next Steps |
|------|---------------------------------------------|-------------|--------------------|
| 1    | **Data Understanding & Loading**            | ✅Complete | `train.csv` (1460 obs) and `test.csv` loaded; reviewed `data_description.txt` |
| 2    | **Data Cleaning & Preprocessing**           | ✅Complete | Training set nearly clean; test set NA imputation and factor cleaning still in progress |
| 3    | **Exploratory Data Analysis (EDA)**         | ✅Complete | Univariate/bivariate analysis done; RShiny app deployed for GrLivArea vs SalePrice by neighborhood |
| 4    | **Analysis 1 – Century 21 Client Model**    | 🔄In Progress | Interaction model (`SalePrice ~ GrLivArea * Neighborhood`) built for NAmes/Edwards/BrkSide; scaling GrLivArea to 100 sq ft units; assumption checks & Cook’s D next |
| 5    | **Feature Engineering & Transformations**   | 🔄In Progress | log(SalePrice), selected interactions, and dummy variables underway |
| 6    | **Analysis 2 – Predictive Modeling**        | 🔄In Progress | SLR & MLR (`GrLivArea + FullBath`) complete; enhanced MLR with interactions in progress |
| 7    | **Model Diagnostics & Assumption Checking** | 🔄In Progress | Residual plots, normality, homoscedasticity, Cook’s D, leverage, and VIF for all models |
| 8    | **Model Comparison & Selection**            | ⏳Not Started | Adjusted R², CV PRESS, AIC; prepare comparison table |
| 9    | **Prediction & Kaggle Submission**          | ⏳Not Started | Generate predictions on cleaned test set using best model |
| 10   | **Final Report & Documentation**            | 🔄In Progress|  Drafting 7-page report (Analysis 1 + Analysis 2 sections); code appendix and Shiny link to be added |

**Current Focus (as of April 7, 2026)**:  
Complete assumption checks and influential point analysis for Analysis 1 → diagnose and compare models for Analysis 2.

### Analysis 1: Client-Focused Regression for Century 21 Ames
Century 21 Ames sells homes only in the **NAmes**, **Edwards**, and **BrkSide** neighborhoods. We investigated the relationship between **SalePrice** and living area (**GrLivArea**, scaled in 100 sq. ft. increments as preferred by realtors) and whether this relationship differs by neighborhood.

- **Model**: Multiple linear regression with interaction terms (GrLivArea × Neighborhood).
- Deliverables include parameter estimates, confidence intervals, residual diagnostics, Cook's D / leverage analysis for influential observations, and a clear interpretation for the client.
- **RShiny App**: Interactive visualization of SalePrice vs. GrLivArea (filterable by neighborhood).  
  → Live app: [https://powellonpoint.shinyapps.io/Ames_Iowa_Housing_Sales_EDA_2006-2010/](https://powellonpoint.shinyapps.io/Ames_Iowa_Housing_Sales_EDA_2006-2010/)

### Analysis 2: Predictive Modeling for All of Ames, Iowa
We built and compared multiple linear regression models (limited to techniques covered in MSDS 6371) to predict **SalePrice** across all neighborhoods:

- **Candidate Models**:
  - Simple Linear Regression (SLR) – `GrLivArea`.
  - Multiple Linear Regression (MLR1) – `SalePrice ~ GrLivArea + FullBath`.
  - Additional MLR model(s) with feature selection, transformations, and interactions.

- **Evaluation Metrics**: Adjusted R², CV PRESS, AIC, and public Kaggle score (RMSE on log(SalePrice)).
- The best model was selected based on predictive performance and submitted to Kaggle.

## Repository Structure

```
Housing-Prices-Regression/
├── data/
│   ├── train.csv                  # Training data with SalePrice (1460 obs)
│   ├── train_cleaned.csv          # Cleaned training data (1460 obs)
│   ├── test.csv                   # Test data for Kaggle submission (1459 obs)
│   ├── test_cleaned.csv           # Cleaned test data for Kaggle submission (1459 obs)
│   └── sample_submission.csv      # Kaggle submission template
├── code/
│   ├── Data Cleaning.rmd.         # Notes and steps producing train_cleaned.csv and test_cleaned.csv
│   ├── analysis1_century21.R      # Analysis 1: Neighborhood-specific regression
│   ├── analysis2_predictive.R     # Analysis 2: Competing predictive models
│   ├── utils_data_prep.R          # Data preparation utilities for predictive modeling
│   └── Executive_Summary.R
├── shiny_app/                     # RShiny interactive dashboard
│   ├── app.R                      # Base app
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