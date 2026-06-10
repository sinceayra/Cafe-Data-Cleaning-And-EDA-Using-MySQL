# Cafe Sales Analysis Exploratory Data Analysis (EDA) Using SQL

## Project Overview

This project analyzes one year of cafe transaction data (January 2023 – December 2023) using MySQL. The dataset contained missing values, inconsistencies, and formatting issues that required extensive data cleaning before analysis.

After preprocessing, SQL-based exploratory data analysis (EDA) was performed to uncover customer purchasing patterns, identify top-performing products, evaluate payment preferences, and analyze location-wise business performance.

### Skills Demonstrated

* Data Cleaning
* Data Validation
* Aggregate Functions
* Subqueries
* Window Functions
* Business Analysis


## Business Problem

Cafe businesses generate large volumes of transaction data daily, but poor data quality can limit meaningful analysis and decision-making.

This project aims to clean and analyze sales data to answer key business questions and generate actionable insights that can support revenue growth, customer satisfaction, and operational improvements.


## Dataset Information

**Dataset:** Messy Cafe Data

**Source:** Kaggle

### Dataset Description

The dataset contains transaction-level sales records from January 2023 to December 2023. Each row represents a customer transaction and includes information about purchased items, quantity, spending amount, payment method, and transaction location.

### Dataset Schema

| Column Name      | Description                   |
| ---------------- | ----------------------------- |
| Transaction ID   | Unique transaction identifier |
| Item             | Product purchased             |
| Quantity         | Number of items purchased     |
| Price Per Unit   | Cost per item                 |
| Total Spent      | Total transaction value       |
| Payment Method   | Payment mode used             |
| Location         | Transaction location          |
| Transaction Date | Date of transaction           |


## Tools & Technologies

* MySQL
* SQL
* Git
* GitHub


## Data Cleaning

The raw dataset contained several data quality issues that were resolved before analysis:

* Removed duplicate records
* Handled missing values
* Standardized text formatting
* Corrected inconsistent entries
* Validated data consistency
* Ensured appropriate data types

### SQL Concepts Used

* UPDATE Statements
* Aggregate Functions
* Window Functions
* Data Validation Techniques


## Business Questions

The analysis was conducted to answer the following questions:

1. Which product generates the highest revenue?
2. Which item is sold most frequently?
3. What is the most preferred payment method?
4. What is the average amount spent per transaction?
5. Which location generates the highest revenue?
6. How many transactions exceed the average transaction value?


## Exploratory Data Analysis

### SQL Skills Demonstrated

* Data Cleaning
* GROUP BY Analysis
* Aggregate Functions
* Subqueries
* Window Functions
* Data Validation


## Key SQL Queries

### Most Revenue-Generating Product

```sql
SELECT Item,
       SUM(`Total Spent`) AS Revenue
FROM cafe_sales_staging2
GROUP BY Item
ORDER BY Revenue DESC;
```

### Transactions Above Average Spending

```sql
SELECT COUNT(*)
FROM cafe_sales_staging2
WHERE `Total Spent` >
(
    SELECT AVG(`Total Spent`)
    FROM cafe_sales_staging2
);
```


## Key Findings

* Salad generated the highest revenue among all menu items.
* Coffee was the most frequently purchased item based on quantity sold.
* Digital Wallet was the most preferred payment method.
* The average customer spending per transaction was approximately **$8.91**.
* In-store transactions generated the highest revenue.
* Out of **8,485 transactions**, **3,683 transactions** exceeded the average transaction value.

## Business Recommendations

* Continue promoting high-performing products such as Salad.
* Maintain consistent quality for top-selling items like Coffee and Salad.
* Expand and encourage Digital Wallet payment options.
* Strengthen customer engagement within physical store locations.
* Increase takeaway and online order sales through targeted marketing and food delivery partnerships.
* Monitor purchasing patterns regularly to optimize menu offerings and promotions.


## Project Structure

```text
Messy-Cafe-SQL-Analysis/
│
├── dataset/
│   └── Messy Cafe Data.csv
│
├── sql/
│   └── Cafe Data.sql
│
├── results/
│   └── Clean Cafe Data.csv
│
└── README.md
```


## How to Run

1. Download the dataset from the repository.
2. Import the dataset into MySQL.
3. Execute the SQL script containing data cleaning and EDA queries.
4. Review the query outputs and findings.
5. Modify queries to explore additional business questions.


## Author

**Ayra Shaikh**

GitHub: https://github.com/sinceayra

LinkedIn: https://www.linkedin.com/in/ira-s/
