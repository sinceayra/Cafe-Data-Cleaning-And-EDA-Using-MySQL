#Messy Cafe Data Analysis & Exploratory Data Analysis (EDA) Using SQL

#Project Overview
This project analyzes one year of cafe transaction data (January 2023 – December 2023) using MySQL. The dataset contained inconsistencies, missing values, and formatting issues that required extensive cleaning before analysis. After preprocessing the data, SQL-based exploratory data analysis was conducted to uncover customer purchasing patterns, identify revenue-generating products, evaluate payment preferences, and assess location-wise business performance.
The project demonstrates practical SQL skills including data cleaning, aggregation, subqueries, window functions, and business-oriented analysis.

#Business Problem
Cafe businesses generate large volumes of transaction data daily. However, raw transactional data often contains inconsistencies and missing information that can hinder decision-making.
This project aims to clean and analyze sales data to answer key business questions and provide insights that can help improve operational efficiency, customer experience, and revenue generation.

#Objectives
1. Understand the structure and quality of the dataset.
2. Clean and preprocess raw transactional data.
3. Perform exploratory data analysis using SQL.
4. Identify sales trends and customer preferences.
5. Generate actionable business insights and recommendations.

#Dataset Information
1. Dataset Name: Messy Cafe Data
2. Source: Kaggle
3. Dataset Description: The dataset contains transaction-level sales data from a cafe covering the period from January 2023 to December 2023. Each record represents an individual transaction and includes information about purchased items, quantity, spending amount, payment method, and transaction location.

#Dataset Schema
Column Name           
1. Transaction ID      
2. Item               
3. Quantity            
4. Price Per Unit      
5. Total Spent         
6. Payment Method      
7. Location            
8. Transaction Date    


#Tools & Technologies
1. MySQL
2. SQL
3. Git
4. GitHub
5. Data Cleaning
6. Exploratory Data Analysis (EDA)


#Data Cleaning Process
The raw dataset contained several data quality issues that required preprocessing before analysis.
1. Cleaning Tasks Performed
2. Removed duplicate records.
3. Handled missing values.
4. Standardized text formatting.
5. Validated data consistency.
6. Corrected invalid and inconsistent entries.
7. Ensured appropriate data types for analysis.
   
#SQL Concepts Used
1. UPDATE Statements
2. Aggregate Functions
3. Window Functions
4. Data Validation Techniques

#Business Questions
The analysis was conducted to answer the following questions:
1. Which product generates the highest revenue?
2. Which item is sold most frequently?
3. What is the most preferred payment method?
4. What is the average amount spent per transaction?
5. Which location generates the highest revenue?
6. How many transactions exceed the average transaction value?

#Exploratory Data Analysis
SQL Skills Demonstrated
1. Data Cleaning
2. GROUP BY Analysis
3. Aggregate Functions
4. Subqueries
5. Window Functions
6. Data Validation

#Key SQL Queries
1. Most Revenue-Generating Product
  SELECT Item,
         SUM(`Total Spent`) AS Revenue
  FROM cafe_sales_staging2
  GROUP BY Item
  ORDER BY Revenue DESC;

2. Transactions Above Average Spending
  SELECT COUNT(*)
  FROM cafe_sales_staging2
  WHERE `Total Spent` >
  (
      SELECT AVG(`Total Spent`)
      FROM cafe_sales_staging2
  );

#Key Findings
1. Salad generated the highest overall revenue among all menu items.
2. Coffee was the most frequently purchased item based on quantity sold.
3. Digital Wallet was the most preferred payment method across transactions.
4. The average customer spending per transaction was approximately $8.91.
5. In-store transactions generated the highest revenue compared to other locations.
6. Out of 8,485 transactions, 3,683 transactions exceeded the average transaction value.

#Business Recommendations
Based on the analysis:
1. Continue promoting high-performing products such as Salad to maximize revenue.
2. Maintain consistent product quality for top-selling items like Coffee and Salad.
3. Expand and encourage Digital Wallet payment options to improve customer convenience.
4. Strengthen customer engagement within physical store locations, as they contribute the highest revenue.
5. Develop strategies to increase takeaway and online order sales through marketing campaigns and partnerships with food delivery platforms.
6. Monitor customer purchasing patterns regularly to identify opportunities for menu optimization and targeted promotions.

#Project Structure
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

#How to Run
1. Download the messy dataset from the repository
2. Import the dataset into MySQL.
3. Execute the SQL script containing data cleaning and EDA queries.
4. Review query outputs and insights.
5. Modify queries to explore additional business questions.

#Business Impact
This analysis provides valuable insights into customer purchasing behavior, product performance, and payment preferences. The findings can support data-driven decision-making related to inventory management, payment infrastructure, marketing strategies, and revenue optimization.

Author: Ayra Shaikh
GitHub: https://github.com/sinceayra
LinkedIn: https://www.linkedin.com/in/ira-s/

