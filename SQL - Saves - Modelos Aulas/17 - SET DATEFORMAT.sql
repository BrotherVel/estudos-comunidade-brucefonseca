 
USE ContosoRetailDW

--01 - SET DATEFORMAT
/*
	MDY - MÊS / DIA / ANO (Formato padrão americano)
	YMD - ANO / MÊS / DIA (Formato padrão banco de dados)
	DMY - DIA / MÊS / ANO 
	MYD - MÊS / ANO / DIA 
	DYM - DIA / ANO / MÊS
*/
SELECT DISTINCT
	S.DateKey
FROM FactOnlineSales S
----------------------------------------
SET DATEFORMAT YMD

SELECT DISTINCT
	S.DateKey
FROM FactOnlineSales S
WHERE S.DateKey BETWEEN '2007-12-01' AND '2007-12-31'
-- Note que se executar antes de definir para o banco de dados com "SET DATEFORMAT" para o formato que queremos não irá funcionar
-- O "SET DATEFORMAT" é necessário para definir para o banco de dados que formato utilizaremos