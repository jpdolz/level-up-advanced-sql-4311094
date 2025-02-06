-- Get a list of employees who have made more than 5 sales in 2023

SELECT e.firstName
  , e.lastName
  , COUNT(1) AS total_operations
FROM sales AS s
  INNER JOIN employee AS e ON s.employeeId = e.employeeId
GROUP BY 1, 2
HAVING total_operations > 5
ORDER BY total_operations DESC