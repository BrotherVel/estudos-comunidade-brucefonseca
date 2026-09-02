USE ContosoRetailDW;

SELECT
	S.ProductKey AS ID_PRODUTO
	,DATEPART(YEAR, S.DateKey) AS ANO
	,DATEPART(MONTH, S.DateKey) AS MES
	,P.ProductName AS NOME_PRODUTO
	,SUM(S.SalesQuantity) AS QTD
FROM FactSales S
INNER JOIN DimProduct P ON P.ProductKey = S.ProductKey
GROUP BY S.ProductKey, P.ProductName, DATEPART(YEAR, S.DateKey), DATEPART(MONTH, S.DateKey)
HAVING SUM(S.SalesQuantity) < (
	SELECT 	AVG(QTDE)
	FROM (SELECT ProductKey	,SUM(SalesQuantity) AS QTDE FROM FactSales GROUP BY ProductKey) AS VEDAS_PRODUTO
)
ORDER BY SUM(S.SalesQuantity) ASC