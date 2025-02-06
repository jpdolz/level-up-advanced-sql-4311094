WITH year_2020 AS (
  SELECT employeeId
    , salesAmount
    , soldDate
  FROM sales
  WHERE TRUE
    AND DATE(soldDate) > '2019-12-31'
    AND DATE(soldDate) < '2021-01-01'
),
year_2021 AS (
  SELECT employeeId
    , salesAmount
    , soldDate
  FROM sales
  WHERE TRUE
    AND DATE(soldDate) > '2020-12-31'
    AND DATE(soldDate) < '2022-01-01'
),
year_2022 AS (
  SELECT employeeId
    , salesAmount
    , soldDate
  FROM sales
  WHERE TRUE
    AND DATE(soldDate) > '2021-12-31'
    AND DATE(soldDate) < '2023-01-01'
),
year_2023 AS (
  SELECT employeeId
    , salesAmount
    , soldDate
  FROM sales
  WHERE TRUE
    AND DATE(soldDate) > '2022-12-31'
    AND DATE(soldDate) < '2024-01-01'
),
salesmen AS (
  SELECT employeeId
    , firstName
    , lastName
  FROM employee
)
SELECT s.employeeId
  , s.firstName
  , s.lastName
  , y.soldDate
  , MAX(y.salesAmount) AS most_expensive
  , MIN(y.salesAmount) AS least_expensive
FROM year_2023 AS y
  INNER JOIN salesmen AS s ON y.employeeId = s.employeeId
GROUP BY 1, 2, 3
ORDER BY s.employeeId;