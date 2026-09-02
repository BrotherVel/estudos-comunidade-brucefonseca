
USE ContosoRetailDW

DECLARE @PROD INT
SET @PROD = 782

SELECT TOP 100 *
FROM FactOnlineSales
WHERE ProductKey = @PROD