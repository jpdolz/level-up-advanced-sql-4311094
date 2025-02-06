WITH electric_cte AS (
  SELECT modelId
    , model
  FROM model
  WHERE EngineType = 'Electric'
)
SELECT s.salesId
  , s.salesAmount
  , s.soldDate
  , e.firstName AS sales_name
  , e.lastName AS sales_lastname
  , e.title
  , m.model
  , m.EngineType AS type
FROM sales AS s 
  INNER JOIN inventory AS i ON s.inventoryId = i.inventoryId
  INNER JOIN electric_cte as ec ON i.modelId = ec.modelId
  INNER JOIN employee AS e ON s.employeeId = e.employeeId
  INNER JOIN model AS m ON i.modelId = m.modelId
ORDER BY s.salesAmount DESC;


-- 2023-01-14 00:00:00	49785.99	white	2014
-- 2021-12-10 00:00:00	47744.99	fuchsia	2015
-- 2022-08-02 00:00:00	47384.99	green	2015
-- 2021-10-31 00:00:00	46895.99	yellow	2017
-- 2021-04-26 00:00:00	46470.99	salmon	2019
-- 2023-01-19 00:00:00	46346.99	blue	2013
-- 2022-05-23 00:00:00	45811.99	black	2018
-- 2021-04-18 00:00:00	45774.99	azure	2013
-- 2021-03-16 00:00:00	45624.99	sky blue	2014