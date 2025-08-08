# Customer Orders Tracking — SQL Project

## Project Overview  
This project demonstrates foundational SQL skills by creating and querying a simple database designed to track customers, products, and orders.  
It covers essential SQL concepts such as SELECT statements, filtering, JOINs, aggregation, sorting, and use of DISTINCT.

## Database Schema  
- **customers**: Stores customer information (`customer_id`, `customer_name`, `city`)  
- **products**: Stores product details (`product_id`, `product_name`, `price`)  
- **orders**: Tracks customer orders (`order_id`, `customer_id`, `product_id`, `order_date`, `quantity`)

## Sample Data  
- 3 customers (Alice Johnson, Bob Smith, Carol Davis)  
- 3 products (Laptop, Mouse, Keyboard)  
- 4 orders across different dates and customers

## Queries Included

| Query # | Description                                     | SQL Concepts Covered                      |
|---------|------------------------------------------------|------------------------------------------|
| 1       | List all orders for a specific customer         | SELECT, WHERE                            |
| 2       | Show customer names with their orders           | JOIN                                    |
| 3       | Calculate total spending per customer            | JOIN, GROUP BY, SUM                      |
| 4       | Get top 2 customers by spending                   | ORDER BY, LIMIT                         |
| 5       | Filter orders made after a certain date           | WHERE, date filtering                    |
| 6       | List unique products bought by a customer          | DISTINCT                                |
| 7       | Count number of orders per city                      | JOIN, GROUP BY, COUNT                   |
| 8       | Find the order with highest quantity ordered        | ORDER BY DESC, LIMIT                    |

## How to Run  
1. Create the `Customer_Order_Tracking` schema in your MySQL database.  
2. Create tables and insert sample data using the provided SQL scripts.  
3. Run the queries sequentially to explore the data and understand the results.  

## What I Learned  
- How to create tables and define relationships with foreign keys.  
- How to perform INNER JOINs to combine data from multiple tables.  
- Using aggregation functions like SUM and COUNT to analyze data.  
- Filtering results based on conditions including dates.  
- Sorting and limiting results to find top records.  
- Using DISTINCT to remove duplicate entries in result sets.

## Next Steps  
- Add more complex queries with subqueries and CASE statements.  
- Explore window functions for advanced analytics.  
- Build an interactive dashboard using SQL backend with visualization tools like Power BI or Tableau.
