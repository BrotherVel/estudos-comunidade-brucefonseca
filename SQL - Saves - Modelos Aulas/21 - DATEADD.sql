
USE ContosoRetailDW

SELECT
	GETDATE() AS HOJE
	,DATEADD(DAY, 10, GETDATE()) AS DIA
	,DATEADD(MONTH, 1, GETDATE()) AS MÊS
	,DATEADD(MONTH, -10, GETDATE()) AS MENOS_DEZ_MÊS
	,DATEADD(YEAR, 1, GETDATE()) AS UM_ANO
	,DATEADD(HOUR, 1, GETDATE()) AS UMA_HORA
-----------------------------------------------
-- Permite somar datas para obter um resultado
-----------------------------------------------