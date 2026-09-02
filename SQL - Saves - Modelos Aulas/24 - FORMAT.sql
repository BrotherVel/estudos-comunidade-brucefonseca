
USE ContosoRetailDW
-- FORMAT (expressão, 'formato')
-- SELECT FORMAT (GETDATE(), 'dd/MM/yyyy')
/*
	======================================================
	||		Formato		||		Descrição				||
	======================================================
	||	d				||	Dia com 1 ou 2 dígitos.		||
	||	dd				||	Dia com 2 dígitos.			||
	||	ddd				||	Abreviação do dia da semana.||
	||	dddd			||	Nome do dia da semana.		||
	||	M				||	Mês com 1 ou 2 dígitos.		||
	||	MM				||	Mês com 2 dígitos.			||
	||	MMM				||	Abreviação do nome do mês.	||
	||	MMMM			||	Nome do mês.				||
	||	yy				||	Ano com 2 dígitos.			||
	||	yyyy			||	Ano com 4 dígitos.			||
	||	hh				||	Hora de 1 a 12.				||
	||	HH				||	Hora de 0 a 23.				||
	||	mm				||	Minutos.					||
	||	ss				||	Segundos.					||
	||	fff				||	Milésimos de segundo.		||
	======================================================

*/
SELECT TOP 100 
	FORMAT(GETDATE(), 'HH:mm') HORA
