# SQL Sales Analytics Project: Revenue Insights & Business Intelligence
## Project Overview:
This project analyzes sales data from the Awesome Chocolates company to uncover key revenue drivers, top-performing products, regions, and salespeople. The goal is to generate actionable insights to support business decision-making in marketing, sales, and inventory management.
## Business Problem:
The company wants to:
*	Identify top-performing products 
*	Understand revenue distribution across regions 
*	Evaluate salesperson performance 
*	Discover sales trends over time
## Dataset Source & Overview:

Dataset: Awesome Chocolates

Source: Chandoo.org.

While the dataset originates from Chandoo.org, all analysis, queries and insights were independently developed to demonstrate analytical thinking and problem-solving skills.
The dataset consists of the following tables:
*	products – product details (Product, Category, Cost per box) 
*	sales – transaction data (Boxes sold, Amount, Date) 
*	people – sales representatives 
*	geo – regional data
## Methodology:
The analysis was performed using SQL by first exploring and understanding the dataset structure. Multiple tables from the dataset were combined using joins for comprehensive data analysis. Aggregation functions such as SUM, AVG, and COUNT were applied to calculate key metrics and queries were designed to answer specific business questions related to revenue, performance, and trends.
## Queries & Analysis:
1. Top Revenue-Generating Product
SELECT 
    p.Product,
    SUM(p.Cost_per_box * s.Boxes) AS Revenue
FROM products p
JOIN sales s ON p.PID = s.PID
GROUP BY p.Product
ORDER BY Revenue DESC;

Insight: Identifies the highest revenue-generating product for prioritization in marketing and inventory strategy.

2. Total Company Revenue
SELECT 
    SUM(p.Cost_per_box * s.Boxes) AS Total_Revenue
FROM products p
JOIN sales s ON p.PID = s.PID;

Insight: Shows overall business performance in monetary terms.

3.  Revenue by Region
SELECT 
    g.Region,
    SUM(p.Cost_per_box * s.Boxes) AS Revenue
FROM geo g
JOIN sales s ON g.GeoID = s.GeoID
JOIN products p ON p.PID = s.PID
GROUP BY g.Region
ORDER BY Revenue DESC;

Insight: Highlights APAC as the strongest performing region.

4. Top 5 Salespeople by Revenue
SELECT 
    pe.Salesperson,
    SUM(p.Cost_per_box * s.Boxes) AS Revenue
FROM people pe
JOIN sales s ON pe.SPID = s.SPID
JOIN products p ON p.PID = s.PID
GROUP BY pe.Salesperson
ORDER BY Revenue DESC
LIMIT 5;

Insight: Identifies key contributors driving company revenue.

Full Queries at https://github.com/joyuche446/sql-sales-analytics-awesome-chocolates/blob/main/Awesome_chocolates.sql

## Key Insights & Recommendations
*Insights:*
* Orange Choco is the highest revenue-generating product
* APAC is the top-performing region in terms of sales
* Revenue is concentrated among a few high-performing salespeople
* January records the highest sales, indicating a seasonal trend

*Recommendations:*
Based on these insights gained, the following recommendations are made to the business:
*	Product Focus: Increase marketing and inventory for Orange Choco to maximize revenue 
*	Regional Strategy: Invest more in the APAC region to capitalize on strong demand 
*	Sales Optimization: Analyze top-performing salespeople and replicate their strategies across the team 
*	Seasonal Planning: Prepare inventory and campaigns ahead of January to take advantage of peak sales 
## Skills Demonstrated:
**SQL Data Analysis:** Extracting and analyzing business insights from relational sales data 

**Joins (INNER & LEFT JOIN):**  Combining multiple tables to build complete datasets for analysis 

**Aggregate Functions:**  Using SUM(), AVG(), and COUNT() to calculate key business KPIs 

**Data Aggregation & Grouping:**  Applying GROUP BY to analyze performance by product, region, and salesperson 

**Business Intelligence & Insights:** Translating raw SQL results into actionable business recommendations

## Next Steps:
* Build an interactive dashboard (Power BI / Tableau) to visualize revenue trends, regional performance, and top products
* Incorporate time-series analysis to better understand seasonality and trends over time
