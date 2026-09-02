
USE ContosoRetailDW

SELECT
	GETDATE () AS DATA_ATUAL
----------------------------------------------------------------------------
-- O GETDATE traz para nós a data e hora atual da execução da query
-- É muito bom para fazer cáuculos dinâmicos
----------------------------------------------------------------------------
SELECT
	GETDATE ()+10 AS DATA_ATUAL
----------------------------------------------------------------------------
-- É possivel adicionar dias além da data atual obtida
----------------------------------------------------------------------------
SELECT
	YEAR(GETDATE()) AS ANO
	
SELECT
	MONTH(GETDATE()) AS MÊS

SELECT
	DAY(GETDATE()) AS DIA

----------------------------------------------------------------------------
-- Também é possivel extrair somente o ano, mês e dia separadamente
----------------------------------------------------------------------------
SELECT
	*
FROM FactOnlineSales
WHERE YEAR(DateKey) = 2007
AND MONTH(DateKey) = 12
----------------------------------------------------------------------------
-- Como a seleção de ano, mês e dia se abrem diversas possibilidades de seleção ou de filtros (WHERE)
-- Nesta pesquisa só aparecerão os itens que possuem o ano e o mês definidos no WHERE
----------------------------------------------------------------------------