
USE ContosoRetailDW
/*
Existe uma diferença na quantidade de produtos da tabela de produtos com a tabela de vendas. 
Isso indica que existe um produto que nunca foi vendido
*/

SELECT 
	COUNT(DISTINCT(D.ProductKey))
FROM DimProduct AS D

SELECT 
	COUNT(DISTINCT(F.ProductKey))
FROM FactSales AS F

/*
Quando fazemos a seleção LEFT consideramos todos os dados que possuem na tabela "Dimproduct" 
mesmo que a tabela "FactSales" não possua o item.
Note pelo número de itens que aparecem como resultado da tabela que é a mesma quantidade do primeiro select
*/
SELECT 
	COUNT(DISTINCT(P.ProductKey))
FROM DimProduct AS P
LEFT JOIN FactSales AS S ON S.ProductKey = P.ProductKey

/*
Agora uma pesquisa com todos os produtos vendidos, seus dados de venda + o(s) produto(s) que só aparece na tabela de produtos
(Isso porde significar que esse produto nunca foi vendido)
*/
SELECT DISTINCT
	P.ProductKey as 'todos os produtos'
	,P.ProductName
	,S.ProductKey as'produtos vendidos'
FROM DimProduct AS P
LEFT JOIN FactSales AS S ON S.ProductKey = P.ProductKey
ORDER BY 3
