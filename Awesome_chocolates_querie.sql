Use `awesome chocolates`;
show tables;
-- Q1: Which product generated the highest Revenue?
SELECT * FROM products; -- To show columns in products table
SELECT * FROM sales; -- To show columns in sales table
-- Query to determine product with the highest revenue
SELECT
products.PID,
products.Product,
products.Cost_per_box,
SUM(sales.Boxes) AS Total_Boxes_sold,
SUM(products.Cost_per_box * sales.Boxes) AS Revenue
FROM products
LEFT JOIN sales
ON products.PID=  sales.PID
GROUP BY products.PID,
products.Product
ORDER BY Revenue DESC;

-- ANSWER: Orange Choco generate the highest revenue. This should be a high priority product -Note for Marketing and Inventory dept.
-- Note: Although the `Amount` column exists in the sales table and represents the
-- transaction value, revenue is calculated manually using `Cost_per_box * Boxes`.
-- This approach demonstrates the underlying business logic (price × quantity) and
-- provides transparency in how revenue is derived from the dataset.

-- Q2: What is the Total revenue for the entire company?
SELECT
CONCAT('$',FORMAT(SUM(products.Cost_per_box * sales.boxes),2)) AS Total_Revenue_in_company
FROM products
 LEFT JOIN sales 
 ON products.PID=sales.PID;
 
 -- ANSWER: Total revenue for the entire company is $9,657,099.69
 
 -- Q3: What Region has the highest sales?
SELECT * FROM geo;  -- To see the columns of geo table
SELECT * FROM sales; -- To see the columns of sales table
SELECT * FROM products; -- To see the columns of products table
SELECT geo.Region,
CONCAT('$',FORMAT (SUM(products.cost_per_box * sales.boxes),2)) AS Total_Revenue
FROM geo
LEFT JOIN sales
ON geo.GeoID =sales.GeoID
LEFT JOIN products
ON products.PID=sales.PID
GROUP BY geo.Region
ORDER BY Total_Revenue DESC;

-- ANSWER: APAC Region is the region with the highest total sales

 -- Q4: Who are the top 5 salespeople by revenue?
SELECT * FROM people; -- To see the columns in the people's table
SELECT * FROM sales; -- To see the columns in the sales' table
SELECT * FROM products; -- To see the columns in the product's table
SELECT people.Salesperson,
CONCAT('$',FORMAT(SUM(sales.boxes * products.cost_per_box),2)) AS Total_Revenue
FROM people
LEFT JOIN sales
ON people.SPID =sales.SPID
LEFT JOIN products
ON sales.PID = products.PID
GROUP BY people.salesperson
ORDER BY Total_Revenue DESC
LIMIT 5;

-- ANSWER: The Top 5 Salesperson by Revenue are Wilone O'Kielt, Gunar Cockshoot, Madelene Upcott, Dotty Strutley and Kelci Walkden 
-- with Revenues $427,690.20, $426,492.49, $425,572.37, $417,226.97 and $413,410.02 respectively

 -- Q5: Which Product category contributes the most to Revenue?
 SELECT * FROM products; -- To see the columns in the Product's table
 SELECT * FROM sales; -- To see the columns in the Sales' table
 SELECT products.Category,
 CONCAT('$',FORMAT(SUM(products.Cost_per_box * sales.boxes),2)) AS Total_Revenue
 FROM products
 LEFT JOIN sales
 ON products.PID =sales.PID
 GROUP BY products.Category;
 
 -- ANSWER: The Bar's category contribute the most to the Revenue(with $4,926,198.03)
 
  -- Q6: What is the average sale amount per transaction?
  SELECT * FROM sales; -- To see the columns in the Sales column
  SELECT 
  CONCAT('$',FORMAT(AVG(sales.boxes * products.cost_per_box),2)) AS Avg_sale
  FROM sales
  LEFT JOIN products
  ON sales.PID= products.PID;
  
  -- ANSWER: The Average sale amount per transaction is $1,267.84
  
   -- Q7: What month had the highest Total sales
   SELECT * FROM sales; -- To see what is in this table and what column to use to extract Month as there is no 'Month' column.
   SELECT 
   MONTHNAME(SaleDate) AS Month,
   SUM(products.cost_per_box * sales.boxes) AS Total_sales
   FROM sales
   LEFT JOIN products
   ON sales.PID=products.PID
   GROUP BY MONTHNAME(SaleDate) 
   ORDER BY Total_sales DESC;
   
   -- ANSWER: January is the month with the highest total sales with a total sales of 1799128.87(cost_per box * boxes sold)
   /*NOTE: Total sales here was calculated by multiplyong the cost_per box by the number of boxes sold. Below, I will determine the Total sales
  by the 'Amount' column (called step 2)  */
   
   SELECT * FROM sales; -- To see the columns in the sales column
   SELECT 
   MONTHNAME(SaleDate) AS Month,
   SUM(Amount) AS Total_Amount
   FROM sales
   GROUP BY  MONTHNAME(SaleDate)
   ORDER BY Total_Amount DESC;
   
   -- ANSWER: Using Total Amount as the basis to determine total sales, January is the Month also with highest total sales amount
   
    -- Q8: Which Customers(if available) made the most purchases?
    -- 1) The most purchase calculated based on the number of times a customer made purchases
    SELECT * FROM sales; -- To see the columns in the sales data
   SELECT 
   Customers,
   COUNT(Customers) AS Number_of_Purchases
   FROM sales
   GROUP BY Customers
   ORDER BY Number_of_Purchases DESC;
   
   -- Answer: Customer 32 made the most purchases in terms of number of times- This shows this is the most regular Customer for this company.
   -- This customer purchase more times compared to the other Customers
   
    -- 2) The most purchase calculated based on the number of boxes bought/Quantity
    SELECT 
    Customers,
    SUM(Boxes) AS Total_Boxes_Bought
    FROM sales
    GROUP BY Customers
    ORDER BY Total_Boxes_Bought DESC;
    
-- ANSWER: Customer 32 has the most purchases in terms of Quantity of boxes bought
   
     -- Q9: What is the total revenue per product?
     -- Total Revenue here is calculated based on the total Amount for each Product
     SELECT * FROM sales; -- To see the columns in sales table
	SELECT * FROM products; -- To see the columns in products table
    SELECT 
    products.Product,
    SUM(sales.Amount) As Total_Revenue
    FROM products
    LEFT JOIN sales
    ON products.PID=sales.PID
    GROUP BY product;
    
    -- Total Revenue here is calculated based on the total cost_per_box multiplied by the total boxes
    SELECT 
    products.Product,
    SUM(products.cost_per_box * sales.boxes) AS Total_Revenue_per_Product
    FROM products
    LEFT JOIN sales
    ON products.PID =sales.PID
    GROUP BY Product;
    
-- Q10: Which region-product combination generates the most revenue?
SELECT * FROM products; -- To see the products table
SELECT * FROM sales; -- To see the sales table
SELECT * FROM geo; -- To see the geo table
SELECT 
geo.Region,
products.Product,
SUM(sales.Amount) AS Total_Revenue
FROM products
LEFT JOIN sales
ON sales.PID = products.PID
LEFT JOIN geo
ON geo.GeoId = sales.GeoID
GROUP BY Region,
Product
ORDER BY Total_Revenue DESC
LIMIT 5;

-- ANSWER: The Region-product combination that generated the most Revenue is APAC/Spicy Special Slims

-- Q11: Which salesperson has the highest average sale amount?
SELECT * FROM people; -- To show the columns in the poeple table
SELECT * FROM sales; -- To show the columns in the poeple table
SELECT people.salesperson,
Avg(sales.Amount) As Average_Amount
FROM people
LEFT JOIN sales 
ON sales.SPID=people.SPID
GROUP BY people.salesperson
ORDER BY Average_Amount DESC
LIMIT 5;

-- The salesperson with the highest average sale is  Wilone O'Kielt

-- Q12: How many products have ever been sold?
SELECT 
COUNT(Product) As Total_Products_sold
FROM products

-- ANSWER: The number of products ever sold is 22




    

     
     

 
 
 
 
