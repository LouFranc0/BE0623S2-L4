--1 

SELECT *
FROM dbo.IMPIEGATI
WHERE Eta > 29;

--2 

SELECT *
FROM dbo.IMPIEGATI
WHERE [RedditoMensile ] >= 800;

--3 

SELECT * 
FROM dbo.IMPIEGATI
WHERE [DetrazioneFiscale] = 'true';

--4 

SELECT * 
FROM dbo.IMPIEGATI
WHERE [DetrazioneFiscale] = 'false';

--5 

SELECT * 
FROM dbo.IMPIEGATI WHERE Cognome LIKE 'G%' ORDER BY Cognome;

--6 
SELECT COUNT(*) AS NumeroTotaleImpiegati
FROM dbo.IMPIEGATI;

--7 

SELECT SUM([RedditoMensile ]) AS TotaleRedditiMensili
FROM dbo.IMPIEGATI;

--8 

SELECT MAX([RedditoMensile ]) AS ImportoRedditoMensileMaggiore
FROM dbo.IMPIEGATI;

--9 
SELECT MIN(RedditoMensile) AS ImportoRedditoMensileMinore
FROM dbo.IMPIEGATI;

--10 

SELECT *
FROM dbo.IMPIEGATI
WHERE DataAssunzione BETWEEN '2007-01-01' AND '2023-01-01';

--11 
DECLARE @TipoImpiego NVARCHAR(50) = 'Developer';
SELECT * FROM dbo.IMPIEGATI
INNER JOIN IMPIEGO ON IMPIEGATI.IDImpiegato = IMPIEGO.IDImpiego
WHERE TipoImpiego = @TipoImpiego;



--12 

SELECT AVG(Eta) AS EtàMediaImpiegati
FROM dbo.IMPIEGATI;


--STORE PROCEDURE


CREATE PROCEDURE AggiungiImpiegato

    @Cognome NCHAR(20),
    @Nome NCHAR(20),
    @Eta SMALLINT,
    
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.IMPIEGATI (Nome, Cognome, [Eta ])
    VALUES (@Cognome, @Nome, @Eta);
END

