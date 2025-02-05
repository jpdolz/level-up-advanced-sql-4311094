WITH sales_customer AS (  
  SELECT s.*
    , c.firstName
    , c.lastName
  FROM sales AS s
    LEFT JOIN customer AS c ON s.customerId = c.customerId
),
customer_sales AS (
  SELECT s.*
    , c.firstName
    , c.lastName
  FROM customer AS c
    LEFT JOIN sales AS s ON c.customerId = s.customerId
)
SELECT *
FROM sales_customer
UNION
SELECT *
FROM customer_sales;