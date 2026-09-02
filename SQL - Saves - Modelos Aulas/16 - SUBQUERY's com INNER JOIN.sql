
USE ContosoRetailDW

SELECT TOP (5) *
FROM FactSales S
-- TOP 5 PRODUTOS COM MAIOR VENDA
--------------------------------------------------------------------------------------------------
-- Uma query simples para obter uma lista dos top 5 produtos mais vendidos
--------------------------------------------------------------------------------------------------
SELECT TOP (5) 
	S.ProductKey
	,SUM(S.SalesAmount) AS SALES
FROM FactSales S
GROUP BY S.ProductKey
ORDER BY SUM(S.SalesAmount) desc
-- TODAS AS VENDAS DOS PRODUTOS COM MAIOR VENDA (TOP 5)
--------------------------------------------------------------------------------------------------
-- Com essa tabela (lista) podemos transforma-la em um INNER JOIN para puxar mais dados da tabela principal
-- Desta forma é possivel ter uma tabela com a intercessão entre os itens obtidos anteriormente e a tabela principal
-- Note que os valores de soma (SALES) não interferem com a obtensão do resultado e são ignorados
--------------------------------------------------------------------------------------------------
SELECT S2.*
FROM FactSales S2
INNER JOIN (
SELECT TOP (5) 
	S.ProductKey
	,SUM(S.SalesAmount) AS SALES
FROM FactSales S
GROUP BY S.ProductKey
ORDER BY SUM(S.SalesAmount) desc
) AS TOP5 ON TOP5.ProductKey = S2.ProductKey
-- VALIDAÇÃO TOP 5
--------------------------------------------------------------------------------------------------
-- Desta forma é possivel fazer uma "prova real" dos dados obtidos se batem com a primeira tabela
-- Pegamos a tabela completa que conseguimos anteriormente e selecionamos ela com o (FROM)
-- Por fim selecionamos somente os itens distintos
--------------------------------------------------------------------------------------------------
SELECT 
	DISTINCT(VAL.ProductKey)
	,VAL.UnitPrice
FROM (SELECT S2.*
FROM FactSales S2
INNER JOIN (
SELECT TOP (5) 
	S.ProductKey
	,SUM(S.SalesAmount) AS SALES
FROM FactSales S
GROUP BY S.ProductKey
ORDER BY SUM(S.SalesAmount) desc
) AS TOP5 ON TOP5.ProductKey = S2.ProductKey) AS VAL
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
/* Isso mostra que alem de listas, as querys que montamos se tornam tabelas tambem 
que podemos manipurlar da mesma forma que as outras ja estabelecidas
*/
