🏬 Retail Store Business Intelligence Analysis — Zudio Case Study (SQL Project)
📌 Project Overview

This project presents a comprehensive business intelligence analysis of a multi-location retail fashion brand using MySQL.

Rather than performing basic SQL aggregation, the objective of this analysis was to simulate real-world business decision-making by answering strategic questions that retail executives and operations leaders typically face.

Key analytical themes explored:

What factors influence revenue growth — geography, store operations, or product categories?

Do larger stores actually perform better?

Are extended operating hours improving profitability?

How dependent is the business on top-performing stores?

Where do profit margins decline despite strong sales?

The project delivers 70 structured analytical queries covering financial performance, customer behaviour, operational efficiency, and expansion strategy.

🗂 Dataset Description

The dataset represents transactional and operational information from multiple retail stores across different regions.

Dataset Includes:

📍 Location details (State, City)

🏪 Store attributes (type, size, manager, staffing)

🧾 Order-level transactions

👤 Customer information

👕 Product and category segmentation

💰 Revenue and profitability metrics

⏱ Store operating schedules

Important Fields

State, City, Category, Clothing Type
Store Number, Store Type
Selling Area Size (sq ft), Staff Count
Order ID, Order Date, Month
Customer ID, Product ID
Price, Quantity, Sales Profit
Opening_time, Closing_Time, Operating_hrs

🛠 Data Preparation & Feature Engineering
🔹 Operating Hours Transformation

The original operating schedule appeared as a single text field:

10 AM - 9 PM

It was transformed into structured variables:

Opening_time

Closing_Time

Operating_hrs

This enabled deeper operational analytics such as:

Revenue generated per operating hour

Store efficiency comparison

Productivity benchmarking between stores

📊 Analytical Framework

The analysis is organized into seven major business domains.

1️⃣ Revenue & Profitability Analysis

Revenue contribution by state

Profit margin comparison across categories

Identification of high-revenue low-margin stores

Store profitability ranking

Margin erosion detection

2️⃣ Store Performance Evaluation

Owned vs rented store performance

Revenue per square foot

Revenue per employee

Impact of parking and security facilities

Identification of inefficient large stores

High-performing compact store analysis

3️⃣ Product & Category Intelligence

Best-performing product categories

Category revenue share contribution

Profit-per-unit analysis

Seasonal demand behaviour

Expansion opportunity identification

4️⃣ Customer Behaviour Analytics

Top revenue-generating customers

Repeat customer identification

Customer lifetime value estimation

Order frequency distribution

Pareto analysis of revenue concentration

5️⃣ Time-Series Performance Insights

Monthly revenue and profit trends

Growth pattern analysis

Peak and low-performing months

Seasonal category behaviour

Store maturity vs revenue performance

6️⃣ Operational Efficiency Metrics

Revenue per operating hour

Profit efficiency benchmarking

Revenue density by state

Staff productivity impact analysis

Store size vs profitability relationship

7️⃣ Strategic Decision Analysis

Impact assessment of closing underperforming stores

Geographic expansion recommendations

Revenue concentration risk evaluation

Category vs location dependency analysis

Margin optimisation opportunities

📈 Sample Business Insights

A small percentage of stores contributes a significant portion of overall revenue, indicating concentration risk.

Some large-format stores underperform smaller outlets in profitability efficiency.

Certain product categories maintain strong margins but limited sales penetration, suggesting growth opportunities.

Extended operating hours do not consistently correlate with higher profits.

Operational optimisation may deliver stronger returns than aggressive expansion.

(Insights derived after executing analytical queries.)

🧠 Skills Demonstrated

Advanced SQL (MySQL)

Complex Aggregations

Window Functions (NTILE, LAG)

Common Table Expressions (CTEs)

Business KPI Design

Profitability & Efficiency Analysis

Data Transformation & Feature Engineering

Analytical Storytelling

🧰 Tools & Technologies

MySQL 8

SQL Analytics

Data Preparation Techniques

GitHub Documentation

🚀 Project Value

Typical SQL exercises focus on descriptive reporting.

This project focuses on decision intelligence — using data analysis to guide operational and strategic business actions.

📬 Connect

If you are interested in analytics, business intelligence, or data-driven retail strategy, feel free to connect with me on LinkedIn.

⭐ If you find this project useful, consider starring the repository.
