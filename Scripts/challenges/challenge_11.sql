WITH manager_list AS (
  SELECT DISTINCT managerId AS employeeId
  FROM employee
  WHERE managerId NOTNULL
),
manager_names AS (
  SELECT --
    e.employeeId
    , e.firstName
    , e.lastName
  FROM employee AS e
    INNER JOIN manager_list AS ml ON e.employeeId = ml.employeeId
)
SELECT e.firstName AS employee_name
  , e.lastName AS employee_last_name
  , m.firstName AS manager_name
  , m.lastName AS manager_last_name
FROM employee AS e 
  JOIN manager_names AS m ON e.managerId = m.employeeId
ORDER BY e.employeeId;

GO

SELECT --
  e.firstName AS employee_name
  , e.lastName AS employee_lastname
  , m.firstName
  , m.lastName
FROM employee AS e 
  INNER JOIN employee AS m ON e.managerId = m.employeeId
ORDER BY e.employeeId;