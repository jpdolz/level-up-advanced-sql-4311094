SELECT e.employeeId
  , e.firstName
  , e.lastName
FROM employee AS e
  LEFT JOIN sales AS s ON e.employeeId = s.employeeId
WHERE TRUE
  AND e.title = 'Sales Person'
  AND s.salesId IS NULL
ORDER BY e.employeeId;
