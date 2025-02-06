-- Sales per user per month in 2021
WITH year_cte AS (
  SELECT s.soldDate
    , e.employeeId
    , e.firstName
    , e.lastName
    , s.salesAmount
  FROM sales AS s 
    INNER JOIN employee AS e ON s.employeeId = e.employeeId
  WHERE s.soldDate > '2020-12-31'
  AND s.soldDate < '2022-01-01'
),
month_cte AS (
  SELECT y.*
    , strftime('%m', y.soldDate) AS month
  FROM year_cte AS y
)
SELECT month
  , employeeId
  , firstName
  , lastName
  , SUM(salesAmount) AS totals
FROM month_cte
GROUP BY 1, 2, 3, 4
ORDER BY month, totals DESC