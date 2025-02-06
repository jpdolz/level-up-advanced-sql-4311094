SELECT e.employeeId
  , e.firstName
  , e.lastName
  , e.title
  , SUM(s.salesAmount) AS total_sold
  , COUNT(s.salesId) AS num_operations
FROM sales AS s
  INNER JOIN employee AS e ON s.employeeId = e.employeeId
GROUP BY 1, 2, 3, 4
ORDER BY num_operations DESC