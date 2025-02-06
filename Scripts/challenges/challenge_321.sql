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
  SELECT employeeId
    , firstName
    , lastName
    , soldDate
    , CASE
        WHEN strftime('%m', soldDate) = '01' 
        THEN salesAmount ELSE NULL
    END AS JanSales
    , CASE
        WHEN strftime('%m', soldDate) = '02' 
        THEN salesAmount ELSE NULL
    END AS FebSales
    , CASE
        WHEN strftime('%m', soldDate) = '03' 
        THEN salesAmount ELSE NULL
    END AS MarSales
    , CASE
        WHEN strftime('%m', soldDate) = '04' 
        THEN salesAmount ELSE NULL
    END AS AprSales
    , CASE
        WHEN strftime('%m', soldDate) = '05' 
        THEN salesAmount ELSE NULL
    END AS MaySales
    , CASE
        WHEN strftime('%m', soldDate) = '06' 
        THEN salesAmount ELSE NULL
    END AS JunSales
    , CASE
        WHEN strftime('%m', soldDate) = '07' 
        THEN salesAmount ELSE NULL
    END AS JulSales
    , CASE
        WHEN strftime('%m', soldDate) = '08' 
        THEN salesAmount ELSE NULL
    END AS AugSales
    , CASE
        WHEN strftime('%m', soldDate) = '09' 
        THEN salesAmount ELSE NULL
    END AS SepSales
    , CASE
        WHEN strftime('%m', soldDate) = '10' 
        THEN SalesAmount ELSE NULL
    END AS OctSales
    , CASE
        WHEN strftime('%m', soldDate) = '11' 
        THEN SalesAmount ELSE NULL
    END AS NovSales
    , CASE
        WHEN strftime('%m', soldDate) = '12' 
        THEN SalesAmount ELSE NULL
    END AS DecSales
  FROM year_cte
),
aggr AS (
  SELECT employeeId
    , firstName
    , lastName
    , SUM(JanSales) AS JanTotals
    , SUM(FebSales) AS FebTotals
    , SUM(MarSales) AS MarTotals
    , SUM(AprSales) AS AprTotals
    , SUM(MaySales) AS MayTotals
    , SUM(JunSales) AS JunTotals
    , SUM(JulSales) AS JulTotals
    , SUM(AugSales) AS AugTotals
    , SUM(SepSales) AS SepTotals
    , SUM(OctSales) AS OctTotals
    , SUM(NovSales) AS NovTotals
    , SUM(DecSales) AS DecTotals
  FROM month_cte
  GROUP BY 1, 2
)
SELECT *
FROM aggr
ORDER BY firstName;

-- 2021-01-07 00:00:00	Renard	Ulrik	16770.99
-- 2021-01-11 00:00:00	Clemence	Dryburgh	40515.99
-- 2021-01-14 00:00:00	Jourdan	Crowhurst	20239.99
-- 2021-01-15 00:00:00	Dniren	Stonham	25525.99
-- 2021-01-19 00:00:00	Sutton	Acosta	33774.99
-- 2021-01-19 00:00:00	Marie	Powys	46398.99
-- 2021-01-23 00:00:00	Lorant	Barlow	14208.99
-- 2021-01-23 00:00:00	Mariette	Camerello	38033.99
-- 2021-01-24 00:00:00	Renard	Ulrik	39425.99
-- 2021-01-28 00:00:00	Cammy	Jesse	37519.99