# SQL Sales Analytics Project: Revenue Insights & Business Intelligence
## Project Overview:
This project presents an SQL-based analysis of the Awesome Chocolates sales data to identify key revenue drivers, top-performing products, regions, and salesperson performance. It generates actionable insights to support decision-making in marketing, sales, and inventory management.
## Business Problem:
The company wants to:
*	Identify top-performing products 
*	Understand revenue distribution across regions 
*	Evaluate salesperson performance 
*	Discover sales trends over time
## Dataset Source & Overview:

Dataset: Awesome Chocolates (source: Chandoo.org)

The dataset includes:

- Products: product details (category, cost per box)
- Sales: transaction data (boxes sold, amount, date)
- People: sales representatives
- Geo: regional data

All analysis and insights were independently developed.
## Methodology:
The analysis was performed using SQL by first exploring and understanding the dataset structure. Multiple tables from the dataset were combined using joins for comprehensive data analysis. Aggregation functions such as SUM, AVG, and COUNT were applied to calculate key metrics and queries were designed to answer specific business questions related to revenue, performance, and trends.
## SQL Queries:
![View Full SQL Queries](Awesome_chocolates.sql)
## Key Insights & Recommendations
### Insights
- Top product: Orange Choco is highest revenue contributor
- Top region: APAC is the #1 in total sales
- Sales concentration: Top 5 salespeople drive a significant share of revenue (>$2M combined)
- Seasonality: January records the highest sales (~$1.8M)
### Recommendations
- Prioritise Orange Choco (highest revenue driver)
- Increase investment in APAC (top-performing region)
- Scale strategies of top 5 salespeople across team
- Increase stock + campaigns ahead of January peak
## Skills Demonstrated:
- SQL Data Analysis: Extracted business insights from relational sales data
- Joins (INNER & LEFT): Combined multiple tables for complete analysis
- Aggregate Functions: Used SUM(), AVG(), COUNT() for KPI calculations
- Data Aggregation & Grouping: Applied GROUP BY for column insights


## Next Steps:
* Build an interactive dashboard (Power BI / Tableau) to visualize revenue trends, regional performance, and top products

