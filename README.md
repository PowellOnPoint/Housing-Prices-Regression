# Housing Prices Linear Regression Analysis

**MSDS 6371 - Statistical Foundations for Data Science**  
**Southern Methodist University**  

This repository contains the final project for MSDS 6371 using the [Kaggle House Prices: Advanced Regression Techniques](https://www.kaggle.com/c/house-prices-advanced-regression-techniques) dataset. We focus exclusively on techniques covered in the course (multiple linear regression, transformations, interactions, assumption diagnostics, influential-point analysis, and cross-validation via PRESS).

**Live RShiny App** → [Ames Iowa Housing Sales EDA](https://powellonpoint.shinyapps.io/Ames_Iowa_Housing_Sales_EDA_2006-2010/)

## Table of Contents
- [Project Overview](#project-overview)
- [Repository Structure](#repository-structure)
- [Project Status](#project-status)
- [How to Reproduce](#how-to-reproduce)
- [Authors](#authors)
- [Acknowledgments](#acknowledgments)

## Project Overview

Century 21 Ames (Analysis 1) wants a clear, interpretable model of SalePrice versus GrLivArea (scaled per 100 sq ft) for the NAmes, Edwards, and BrkSide neighborhoods, including interaction effects.  
Analysis 2 builds the strongest possible predictive MLR model(s) across all of Ames for Kaggle submission.

## Project Status

| Step | Pipeline Stage                              | Status      | Notes / Next Steps |
|------|---------------------------------------------|-------------|--------------------|
| 1    | **Data Understanding & Loading**            | ✅Complete | `train.csv` (1460 obs) and `test.csv` loaded; reviewed `data_description.txt` |
| 2    | **Data Cleaning & Preprocessing**           | ✅Complete | Training set clean; test set NA imputation and factors complete |
| 3    | **Exploratory Data Analysis (EDA)**         | ✅Complete | RShiny app deployed for GrLivArea vs SalePrice by neighborhood |
| 4    | **Analysis 1 – Century 21 Client Model**    | ✅Complete | Models complete! |
| 5    | **Feature Engineering & Transformations**   | ✅Complete | Features selected! |
| 6    | **Analysis 2 – Predictive Modeling**        | ✅Complete | Models complete! |
| 7    | **Model Diagnostics & Assumption Checking** | ✅Complete | Assumptions met! Continually assessing model performance |
| 8    | **Model Comparison & Selection**            | ✅Complete | Optimal model selected|
| 9    | **Prediction & Kaggle Submission**          | ✅Complete | Kaggle Scores below! |
| 10   | **Final Report & Documentation**            | ✅Complete | Feedback encouraged!|

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
│   ├── train.csv # Original Kaggle files
│   ├── test.csv # Original Kaggle files
│   ├── data_description.txt # Original Kaggle files
│   ├── train_cleaned.csv
│   ├── test_cleaned.csv
│   ├── submission_slr
│   ├── submission_mlr1
│   ├── submission_mlr2
│   ├── submission_mlr3
│   ├── submission_mlr3n
│   └── sample_submission.csv
├── code/
│   ├── Data Cleaning.Rmd
│   ├── analysis1_century21.rmd    # Analysis 1: Neighborhood-specific regression
│   ├── analysis1_century21.html   # rendered using knitr
│   ├── analysis2_predictive.rmd   # Analysis 2: Competing predictive models
│   ├── Analysis2_predicitve.html. # rendered using quarto
│   ├── Analysis2_predicitve_files # Quarto plot outputs
│   └── utils_data_prep.R          # Data preparation utilities for predictive modeling
├── shiny_app/
│   ├── app.R
│   └── data_descriptions.txt
├── reports/                       # New folder – move PDFs here
│   ├── MSDS6371 Final Project Report.pdf
│   ├── appendix 2 to MSDS6371 Final Project Report.pdf
│   └── appendix 3 to MSDS6371 Final Project Report.pdf
├── README.md
└── LICENSE
```

## Key Techniques Demonstrated
- Data cleaning and exploratory data analysis (EDA)
- Variable transformations and interaction terms
- Model diagnostics: residual plots, normality, homoscedasticity, linearity
- Influential point analysis (Cook's Distance, leverage)
- Cross-validation (PRESS statistic)
- Predictive performance on unseen data via Kaggle submission

All analyses were performed in **R** Full, well-commented code is available in the repository (and included in the project appendix).

## Results Summary 

SLR = `(SalePrice | GrLivArea)`
MLR1 = `(SalePrice | GrLivArea + FullBath)`
MLR2 = `(SalePrice | 25 predictors)` full model after EDA considering linearily related variables
MLR3 = `(SalePrice | TotalSF + Neighborhood + OverallQual)`
MLR3.N = `(SalePrice | TotalSF + NeighborhoodGroup + OverallQual)` After grouping Neighborhood into 4 groups based on median sales price.

- **Adjusted R²**: How well the model explains variance (higher is better)
- **PRESS**: Leave-one-out cross-validation error (lower is better)
- **CV RMSE (log scale)**: 10-fold cross-validation root mean squared error (lower is better)
- **AIC**: Balance between fit and complexity (lower is better)
- **Kaggle Score**: Performance on the Kaggle leaderboard. RMSE between log(Predicted) and log(Actual). (lower is better)

|Model             | Adjusted R²| PRESS| CV RMSE (log)|     AIC|Kaggle Score |
|:-----------------|-----------:|-----:|-------------:|-------:|:------------|
|SLR               |      0.5256|   111|        0.1255|   380.4| 0.29893     |
|MLR1              |      0.5574|   103|        0.1265|   280.9| 0.29090     |
|MLR2              |      0.9167|   Inf|        0.1265| -2053.9| 0.16264     |
|MLR3              |      0.8638|    33|        0.1260| -1407.0| 0.16416     |
|MLR3.N            |      0.8561|    34|        0.1265| -1347.0| 0.16663     |

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
2. run `Data Cleaning.rmd` for cleaned.csv datasets
3. render each analysis .rmd files individually. 
4. Run the Shiny app locally from the `Rshiny EDA/` directory.
5. The project paper contains full details and interpretations.

## Authors
- Aaron Powell – MSDS Candidate, Southern Methodist University  
- Joshua Samuel – MSDS Candidate, Southern Methodist University  

## Acknowledgments
- Course instructors: Dr. Bivin Sadler and Dr. Monnie McGee
- Dataset: Kaggle House Prices: Advanced Regression Techniques
- Special thanks to the SMU MSDS program for the rigorous statistical foundation provided in MSDS 6371.