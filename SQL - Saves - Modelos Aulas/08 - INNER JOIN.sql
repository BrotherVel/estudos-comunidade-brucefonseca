USE ContosoRetailDW
/* 
tabela de canais de venda conectada com a tabela de vendas onde são exibidas as top 100 vendas; 
onde (WHERE) o FactSales.channelkey é igual a 2;
somada com (UNION) na mesma tabela onde (WHERE) o FactSales.channelkey é igual a 4;
Ordenada (ORDER BY) por ordem crecente; 
Desta forma exibindo cada venda e as repectivas informações do canal de venda na mesma tabela de forma organizada;
*/
SELECT TOP 100 
	FactSales.saleskey
	,FactSales.datekey
	,FactSales.channelkey
	,DimChannel.*
FROM FactSales
INNER JOIN DimChannel ON DimChannel.ChannelKey = FactSales.channelkey
WHERE FactSales.channelkey IN(2)
UNION
SELECT TOP 100 
	FactSales.saleskey
	,FactSales.datekey
	,FactSales.channelkey
	,DimChannel.*
FROM FactSales
INNER JOIN DimChannel ON DimChannel.ChannelKey = FactSales.channelkey
WHERE FactSales.channelkey IN(4)
ORDER BY FactSales.channelkey
/*
Pesquisa baseada na junção da tabela de vendas com a de canais de vendas;
definidas a soma da quantidade de produtos
definidas a soma de todos os valores arrecadados
agrupados (GROUP BY) com relação ao nome de cada canal de venda
Desta forma será exibido o nome do canal e, em seguida,
a quantidades de produtos vendidos nele o valor arrecadado
*/
SELECT TOP 100 
	DimChannel.ChannelName AS 'Canal de Venda'
	,SUM(FactSales.SalesQuantity) AS 'Quantidade de produtos vendidos'
	,SUM(FactSales.UnitPrice) AS 'Soma das Vendas'
FROM FactSales
INNER JOIN DimChannel ON DimChannel.ChannelKey = FactSales.channelkey
GROUP BY DimChannel.ChannelName
ORDER BY DimChannel.ChannelName

SELECT TOP 100 
	DimProduct.ProductName AS 'produto'
	,FactSales.SalesQuantity
	,FactSales.UnitPrice
FROM FactSales
INNER JOIN DimProduct ON DimProduct.ProductKey = FactSales.ProductKey



/*
Pesquisa baseada na junção da tabela de vendas com a de produtos;
definidas a soma da quantidade de produtos
definidas a soma de todos os valores arrecadados
agrupados (GROUP BY) com relação ao nome de cada produto
Desta forma será exibido o nome do produto e, em seguida,
a quantidades de vendidas dele o valor arrecadado
*/
SELECT TOP 100 
	DimProduct.ProductName AS 'produto'
	,SUM(FactSales.SalesQuantity) AS 'Quantidade de produtos vendidos'
	,SUM(FactSales.UnitPrice) AS 'Soma das Vendas'
FROM FactSales
INNER JOIN DimProduct ON DimProduct.ProductKey = FactSales.ProductKey
GROUP BY DimProduct.ProductName

SELECT TOP 100 *
FROM FactSales

SELECT TOP 100 *
FROM DimChannel

SELECT TOP 100 *
FROM DimProduct
