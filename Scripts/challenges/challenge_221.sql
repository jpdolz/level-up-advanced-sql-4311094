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
emp AS (
  SELECT employeeId
    , firstName
    , lastName
  FROM employee
)
SELECT e.employeeId
  , e.firstName
  , e.lastName
  , strftime('%Y',s.soldDate) as Year
  , MAX(s.salesAmount) OVER(
    PARTITION BY strftime('%Y',s.soldDate)
    ORDER BY strftime('%Y',s.soldDate)
  ) AS most_expensive
  , MIN(s.salesAmount) OVER(
    PARTITION BY strftime('%Y',s.soldDate)
    ORDER BY strftime('%Y',s.soldDate)
  ) AS least_expensive
FROM sales AS s
  LEFT JOIN emp AS e ON s.employeeId = e.employeeId
ORDER BY e.employeeId;

-- Lorant	Barlow      2021-01-23 00:00:00	46470.99	14208.99
-- Salvatore	Humbee	2021-08-09 00:00:00	47329.99	11867.99
-- Dniren	Stonham     2021-12-04 00:00:00	43332.99	21659.99
-- Erika	Kemson      2021-11-26 00:00:00	26871.99	17389.99
-- Cammy	Jesse       2021-08-27 00:00:00	40037.99	10715.99
-- Toby	Dyas          2021-12-30 00:00:00	47788.99	22824.99
-- Renard	Ulrik       2021-01-07 00:00:00	39425.99	16770.99
-- Natale	Rimington   2021-03-01 00:00:00	47744.99	16171.99