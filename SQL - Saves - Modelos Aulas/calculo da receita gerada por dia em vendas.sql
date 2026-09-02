SELECT 
	[DateKey]
    ,SUM([UnitPrice] - UnitCost) as 'Receita'
    ,SUM([SalesQuantity]) as 'Numero de Vendas'
FROM FactSales
GROUP BY [DateKey]
ORDER BY [Receita] desc