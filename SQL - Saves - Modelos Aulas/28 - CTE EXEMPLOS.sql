USE ContosoRetailDW;

WITH ANALISE_PRODUTO(ID_PRODUTO, ANO, MES, NOME_PRODUTO, QTDE)
AS 
(
	SELECT
		S.ProductKey AS ID_PRODUTO
		,DATEPART(YEAR, S.DateKey) AS ANO
		,DATEPART(MONTH, S.DateKey) AS MES
		,P.ProductName AS NOME_PRODUTO
		,SUM(S.SalesQuantity) AS QTDE
	FROM FactSales S
	INNER JOIN DimProduct P ON P.ProductKey = S.ProductKey
	GROUP BY S.ProductKey, P.ProductName, DATEPART(YEAR, S.DateKey), DATEPART(MONTH, S.DateKey)
)

SELECT TOP 10
	A.*
	,P.*
FROM ANALISE_PRODUTO A
INNER JOIN DimProduct P ON P.ProductKey = A.ID_PRODUTO
ORDER BY QTDE DESC


SELECT TOP 10
	*
FROM ANALISE_PRODUTO
ORDER BY QTDE DESC

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------



