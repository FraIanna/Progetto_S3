-- Esercizio 1
SELECT COUNT (*) AS [Totale Verbali]
	FROM VERBALE

-- Esercizio 2
SELECT
    A.Id AS IdAnagrafica,
    A.Cognome,
    A.Nome,
    COUNT(*) AS NumeroVerbaliTrascritti
FROM
    ANAGRAFICA A
	JOIN
	VERBALE V ON A.Id = V.IdAnagrafica
GROUP BY
    A.Id,
    A.Cognome,
    A.Nome
ORDER BY
    A.Cognome,
    A.Nome;

-- Esercizio 3
SELECT
    A.Cognome,
    A.Nome,
	T.Descrizione AS TipoViolazione,
    COUNT(*) AS NumeroVerbaliTrascritti
FROM
    VERBALE V
	JOIN
	ANAGRAFICA A ON V.IdAnagrafica = V.IdAnagrafica
	JOIN
	[TIPO VIOLAZIONE] T ON V.IdViolazione = T.IdViolazione
GROUP BY
    A.Cognome,
    A.Nome,
	T.Descrizione
ORDER BY
	T.Descrizione
    
-- Esercizio 4
SELECT
    A.Id AS IdAnagrafica,
    A.Cognome,
    A.Nome,
    SUM(V.DecurtamentoPunti) AS PuntiDecurtati
FROM
    ANAGRAFICA A
JOIN
    VERBALE V ON V.IdAnagrafica = A.Id
WHERE
    V.DataTrascrizioneVerbale IS NOT NULL
GROUP BY
    A.Id,
    A.Cognome,
    A.Nome
ORDER BY
    A.Id;

-- Esercizio 5
SELECT 
	A.Cognome, A.Nome,A.Città, V.DataViolazione, 
	V.IndirizzoViolazione, V.DecurtamentoPunti, 
	T.Importo 
FROM 
	VERBALE V 
	JOIN 
		[TIPO VIOLAZIONE] T ON V.IdViolazione = T.IdViolazione
	JOIN
		ANAGRAFICA A ON  V.IdAnagrafica = A.Id		
WHERE A.Città = 'Palermo'

-- Esercizio 6
SELECT 
	A.Cognome, A.Nome, V.DataViolazione, 
	A.Indirizzo, V.DecurtamentoPunti, V.DataViolazione, 
	T.Importo 
FROM 
	VERBALE V 
	JOIN 
		[TIPO VIOLAZIONE] T ON V.IdViolazione = T.IdViolazione
	JOIN
		ANAGRAFICA A ON  V.IdAnagrafica = A.Id
WHERE V.DataViolazione BETWEEN '01-02-2009' AND '31-07-2009'

-- Esercizio 7
SELECT 
    A.Id AS IdAnagrafica,
	A.Nome, 
	A.Cognome,
    SUM(T.Importo) AS TotaleImporto
FROM 
    VERBALE V
	JOIN
		ANAGRAFICA A ON V.IdAnagrafica = A.Id
	JOIN 
		[TIPO VIOLAZIONE] T ON V.IdViolazione = T.IdViolazione
GROUP BY 
    A.Id,
	A.Nome, 
	A.Cognome
ORDER BY 
	A.Id

-- Esercizio 8
SELECT * -- oppure SELECT COUNT(*)
FROM ANAGRAFICA
WHERE Città = 'Palermo'

-- Esercizio 9
SELECT 
	V.DataViolazione, 
	V.DecurtamentoPunti, 
	T.Importo 
FROM 
	VERBALE V 
	JOIN 
		[TIPO VIOLAZIONE] T ON V.IdViolazione = T.IdViolazione
WHERE DataViolazione = '07-06-2023 09:45:00'

-- Esercizio 10
SELECT
	NominativoAgente, 
	COUNT(MultaContestata) AS NumeroMulteContestate
FROM VERBALE 
WHERE MultaContestata = 1
GROUP BY NominativoAgente

-- Esercizio 11
SELECT 
	A.Cognome, A.Nome, V.IndirizzoViolazione,
	V.DataViolazione, V.DecurtamentoPunti, T.Importo 
FROM 
	VERBALE V 
	JOIN 
		[TIPO VIOLAZIONE] T ON V.IdViolazione = T.IdViolazione
	JOIN
		ANAGRAFICA A ON  V.IdAnagrafica = A.Id
WHERE DecurtamentoPunti > 5

-- Esercizio 12
SELECT 
	A.Cognome, A.Nome, A.Indirizzo, V.IndirizzoViolazione,
	V.DataViolazione, V.DecurtamentoPunti,
	T.Importo 
FROM 
	VERBALE V 
	JOIN 
		[TIPO VIOLAZIONE] T ON V.IdViolazione = T.IdViolazione
	JOIN
		ANAGRAFICA A ON  V.IdAnagrafica = A.Id
WHERE T.Importo > 400

