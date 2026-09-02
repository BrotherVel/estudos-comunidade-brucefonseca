
USE ContosoRetailDW

-- DATEPART (Parte, data)
/*
	=========================================================================
	|		Valor		||		Parte Retornada		||		Abreviação		|
	=========================================================================
	|	year			||	Ano						||	yy, yyyy			|
	|	quarter			||	Trimestre (1/4 de ano)	||	qq, q				|
	|	month			||	Mês						||	mm, m				|
	|	dayofyear		||	Dia do ano				||	dy, y				|
	|	day				||	Dia						||	dd, d				|
	|	week			||	Semana					||	wk, ww				|
	|	weekday			||	Dia da semana			||	dw					|
	|	hour			||	Hora					||	hh					|
	|	minute			||	Minuto					||	mi, n				|
	|	second			||	Segundo					||	ss, s				|
	=========================================================================

*/

SELECT TOP (100)
	DateKey
	,DATEPART(year,S.DateKey) AS ANO
	,DATEPART(month, S.DateKey) AS MÊS
	,DATEPART(DAY,S.DateKey) AS DIA
	,DATEPART(dayofyear, S.DateKey) AS DIA_DO_ANO
	,DATEPART(weekday, S.DateKey) AS DIA_DA_SEMANA
FROM FactOnlineSales S
ORDER BY S.DateKey DESC
------------------------------------------------------------------------------
-- Umas das várias formas de seleção com o DATEPART
------------------------------------------------------------------------------
SELECT 
	DATEPART(WEEKDAY,  GETDATE()) AS DIA_DA_SEMANA
------------------------------------------------------------------------------
-- Podemos ver em que dia da semana estamos com uma combinação do DATEPART e do GETDATE
------------------------------------------------------------------------------
SELECT TOP 100
	DATEPART(year,DateKey)
	,*
FROM FactOnlineSales
WHERE DATEPART(year,DateKey) = 2008
------------------------------------------------------------------------------
-- DATEPART com WHERE
------------------------------------------------------------------------------