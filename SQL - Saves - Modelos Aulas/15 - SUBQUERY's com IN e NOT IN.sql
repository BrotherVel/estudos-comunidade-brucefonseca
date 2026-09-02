
USE ContosoRetailDW

SELECT AVG(UnitPrice)
FROM DimProduct
--------------------------------------------------------------------------------------------------
-- Primeiro calculamos a média de preços de todos os produtos
--------------------------------------------------------------------------------------------------
SELECT 
	ProductKey
	,UnitPrice
FROM DimProduct
WHERE UnitPrice <= (SELECT AVG(UnitPrice) FROM DimProduct) --> SUBQUERY
--------------------------------------------------------------------------------------------------
-- Aqui pegamos esse cálculo e transformamos em uma SUBQUERY
-- Desta forma filtramos para obtermos todos os produtos que possuem o valor abaixo da media
--------------------------------------------------------------------------------------------------
SELECT *
FROM FactSales S
WHERE S.ProductKey IN (
	SELECT 
		ProductKey
	FROM DimProduct
	WHERE UnitPrice <= (SELECT AVG(UnitPrice) FROM DimProduct)
)
ORDER BY UnitPrice DESC
--------------------------------------------------------------------------------------------------
-- Agora que temos a lista de todos os produtos que possuem um valor abaixo da média fazemos outra SUBQUERY
-- Desta vez agora só queremos as vendas que dos produtos que foram selecionados na tabela anterior
-- Desta foma podemos saber como se sairam as vendas desses produtos.
--------------------------------------------------------------------------------------------------
SELECT *
FROM FactSales S
WHERE S.ProductKey NOT IN (
	SELECT 
		ProductKey
	FROM DimProduct
	WHERE UnitPrice <= (SELECT AVG(UnitPrice) FROM DimProduct)
)
ORDER BY UnitPrice ASC
--------------------------------------------------------------------------------------------------
-- Aqui um exemplo fazendo o contrár
--------------------------------------------------------------------------------------------------
SELECT 
	S.ProductKey
	,SUM(S.SalesAmount) AS VALOR_TOTAL_VENDIDO 
FROM FactSales S
WHERE S.ProductKey IN (
	SELECT 
		ProductKey
	FROM DimProduct
	WHERE UnitPrice <= (SELECT AVG(UnitPrice) FROM DimProduct)
)
GROUP BY S.ProductKey
ORDER BY S.ProductKey
--------------------------------------------------------------------------------------------------
-- Por fim, um agrupamento que dá a soma de vendas de cada um desses iténs
--------------------------------------------------------------------------------------------------
SELECT *
FROM FactSales S
INNER JOIN DimProduct P ON P.ProductKey = S.ProductKey
WHERE P.UnitPrice <= (SELECT AVG(UnitPrice) FROM DimProduct)
--------------------------------------------------------------------------------------------------
-- Desta forma é possivel conseguir resultados parecidos
-- Entretanto as querys ficam mais pesadas desta forma e mais lentas consequentemente
--------------------------------------------------------------------------------------------------