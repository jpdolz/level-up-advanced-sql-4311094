SELECT s.soldDate
  , s.salesAmount
  , i.colour
  , i.year
FROM sales AS s
  INNER JOIN inventory AS i ON s.inventoryId = i.inventoryId
WHERE i.modelId IN (
  SELECT modelId
  FROM model
  WHERE EngineType = 'Electric'
)
ORDER BY s.salesAmount DESC