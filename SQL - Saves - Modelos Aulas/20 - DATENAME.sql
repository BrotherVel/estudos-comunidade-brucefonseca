
USE ContosoRetailDW

SELECT TOP 100
	DATENAME(DAY, S.DateKey) AS DIA
	,DATENAME(WEEKDAY, S.DateKey) AS DIA_DA_SEMANA
	,DATENAME(MONTH, S.DateKey) AS MÊS
FROM FactOnlineSales AS S
ORDER BY S.DateKey
---------------------------------------------------------------------------------------------------------
-- O DATENAME faz praticamente o mesmo do DATEPART, mas trazendo o nome ao invés do numero de cada parte.
---------------------------------------------------------------------------------------------------------