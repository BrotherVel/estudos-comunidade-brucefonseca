
WITH TOTAL_POR_CATEGORIA AS
(
	SELECT PP.CategoryID
		,COUNT(*) AS TotalCategoria
	FROM [BikeStores].[Production].[Product] PP
	GROUP BY PP.CategoryID
)

SELECT
	P.CategoryID
	,P.BrandID
	,COUNT(*) AS TotalProdutos
	,TC.TotalCategoria AS TotalCategoria
	,COUNT(*)*100.0/TC.TotalCategoria AS 'percent' 
FROM [BikeStores].[Production].[Product] P
INNER JOIN TOTAL_POR_CATEGORIA AS TC ON TC.CategoryID = P.CategoryID
GROUP BY P.CategoryID, P.BrandID, TC.TotalCategoria;

-- USANDO WINDOW FUNCTION PARA AGREGAR

WITH TOTAL_PRODUTOS_CATEGORIA AS
(
	SELECT 
		P.CategoryID
		,P.BrandID
		,COUNT(*) AS TotalProdutos
	FROM [BikeStores].[Production].[Product] P
	GROUP BY P.CategoryID, P.BrandID
)
SELECT *
	,SUM(TotalProdutos) OVER(PARTITION BY CategoryID) AS TotalBikesCategoria
	,TotalProdutos * 100.0 / SUM(TotalProdutos) OVER(PARTITION BY CategoryID) AS 'Percent'
FROM TOTAL_PRODUTOS_CATEGORIA

-- 
