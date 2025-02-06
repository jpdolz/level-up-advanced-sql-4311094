-- Total sales per year

WITH cte AS (
  SELECT strftime('%Y', soldDate) AS year
    , salesAmount
  FROM sales
)
SELECT c.year AS soldYear
  , FORMAT('$%.2f', SUM(c.salesAmount)) AS AnnualSales
FROM cte AS c
GROUP BY 1
ORDER BY 1
