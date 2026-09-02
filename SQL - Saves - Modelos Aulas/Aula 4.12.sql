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
WHERE Education = 'High School'
	AND NumberChildrenAtHome >=1 
	AND NOT MaritalStatus = 'M'
	AND (TotalChildren = 3 OR TotalChildren = 4)
ORDER BY 2 DESC, 3 DESC, 4 DESC, [QuantidadeDeCarros] DESC