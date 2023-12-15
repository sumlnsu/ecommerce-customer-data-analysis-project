# E-commerce-Customer-Data-Analysis
> ✔️ This project utilizes e-commerce customer behavior and purchase data to analyze customer behavior and market trends to ultimately derive and present insights.


## Project Data Source (Kaggle)
The analysis project was conducted by referring to data from the following [Kaggle link](https://www.kaggle.com/datasets/shriyashjagtap/e-commerce-customer-for-behavior-analysis).


## Project Notion Report
This is a [Notion link](https://bramble-trick-355.notion.site/E-commerce-Customer-41e17ee1bd4842c89b0a4b75716c290e?pvs=4) that compiles the overall progress of the analysis project into a report.


## 📋 Proejct Outline


### 📌 Project Goal
* Data analysis and visualization using SQL and EXCEL
* MySQL integration
* Market analysis experience

### 💽 Project Data
* Used Data : ecommerce_customer_data_custom_ratios & ecommerce_customer_data_large
  * Data Shape: 500,000 rows & 13 columns
  * The data table contains e-commerce customer behavior and purchase data (synthetic dataset created using the Faker Python library).
    * Data that simulates a comprehensive e-commerce environment by capturing various aspects of digital marketplaces, customer behavior, and purchase history.
    * Customer ID (Int Type)
    * Purchase Date (Date Type)
    * Product Category (String Type)
    * Product Price (Int Type)
    * Quantity (Int Type)
    * Payment Method (String Type)
    * Returns (Float Type)
    * Age (Int Type)
    * Gender (String Type)
    * Churn (Int Type)

### 🧷 Project Topic
* E-commerce customer analysis (Purpose: Obtain insight into churn and returns, and derive insights to solve related problems)
  * Return Analysis
  * Churn Analysis
  * Sales Analysis
* Trend analysis (market analysis) (Purpose: Analysis of changes in purchase rates within the Home, Electronics, Clothing, Books categories)
* RFM Customer Segmentation Analysis

### ❗️ Project Manager Description
* In this project, everyone processed and analyzed data in their own way on the same topic.
* Since the results derived from each analysis method are different, you may refer to the corresponding analysis code depending on the results.


### 🙋🏻‍♂️ Project manager
* Sumin
  * [Analysis Link](https://bramble-trick-355.notion.site/38ccdccd730a49af8962ae401dcbf1bd?pvs=4)
  * Data Cleaning
  * Data EDA
  * KPI (leading indicator, lagging indicator) column correlation analysis
    * Returns correlation analysis
    * Churn correlation analysis
    * Sales correlation analysis
  * Market trend analysis
    * Seasonal Analysis
    * Analysis by time zone
    * Analysis by product category
    * Sales analysis
    * Presenting direction for e-commerce
  * RFM Customer Analysis
    * Segment customers into 10 categories
    * Provides insights related to promotion targets
* Jinho
  * [Analysis Link](https://bramble-trick-355.notion.site/03070f2875234ecc8b2dae9577024748?pvs=4)
  * MySQL Data Upload
  * Ecommerce Customer Analysis about "Returns"
  * Market trend analysis
    * Date (Month) & Category (Clothing) Correlation Analysis
    * Date (Month) & Category (Electronics) Correlation Analysis
    * Date (Month) & Category (Book) Correlation Analysis
    * Date (month) & category (household) correlation analysis
    * Comparative analysis of product categories)
* YeongSik
  * [Analysis Link](https://bramble-trick-355.notion.site/65421debcf1a4a6fb66e8d86f9b5f377?pvs=4)
  * Data Cleaning
  * Returns & Churn & Sales indicator analysis
  * Market trend analysis
    * Hypothesis establishment and verification
    * Indicator analysis according to US prices
    * Analysis by Gender
    * Analysis by Product Category
* Yurim
  * [Analysis Link](https://bramble-trick-355.notion.site/77389b25cecc42b8b00d4a14876dc6f2?pvs=4)
  * Data Cleaning
  * Analyze Sales
    * Daily sales
    * Monthly sales
    * Monthly PU (Paying User)
    * Monthly ARPPU (Average Revenue Per Paying User)
  * Market trend analysis
    * Number of orders by year + product category
    * Sales by year + product category
    * Number of orders by month + product category
    * Sales trend by month + product category
  * Present direction and questions
    * Raising questions about the unit price of the Clothing & Books category and suggesting possible errors in the unit price through data analysis
