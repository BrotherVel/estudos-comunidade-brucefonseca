USE ContosoRetailDW

SELECT 
	EmailAddress as 'E-mail'
	,Gender as 'Genero'
	,MaritalStatus 'Status'
	,TotalChildren 'Filhos'
	,NumberChildrenAtHome 'FilhosEmCasa'
	,NumberCarsOwned 'QuantidadeDeCarros'
	,Education 'GrauEscolar'
FROM DimCustomer
WHERE Education IN ('Graduate Degree', 'Bachelors')
	AND NumberChildrenAtHome >=1 
	AND NOT MaritalStatus = 'M'
	AND TotalChildren IN (3,4)