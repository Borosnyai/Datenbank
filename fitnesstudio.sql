PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS Mitglied;
DROP TABLE IF EXISTS Zahlung;
DROP TABLE IF EXISTS Benachrichtigung;
DROP TABLE IF EXISTS Mitgliedszahlung;







CREATE TABLE Mitglied (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Vorname TEXT NOT NULL,
	Nachname TEXT NOT NULL,
	jahresgebühr DECIMAL(10,2),
	gesamt_bezahlt DECIMAL(10,2) DEFAULT 0 NOT NULL,
	jahr INTEGER NOT NULL
);

CREATE TABLE Zahlung(
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	mitglied_id INTEGER NOT NULL,
	beitrag DECIMAL(10,2) NOT NULL,
	datum DATETIME NOT NULL,
	zahlungsart TEXT NOT NULL,
	FOREIGN KEY (mitglied_id) REFERENCES Mitglied(id) ON DELETE CASCADE
);

 INSERT INTO Mitglied (Vorname, Nachname, jahresgebühr, gesamt_bezahlt, jahr) VALUES
    ('Max', 'Müller', 300.00, 0, 2024),
    ('Lisa', 'Schmidt', 250.00, 0, 2024),
    ('Thomas', 'Becker', 400.00, 0, 2024);


SELECT * FROM Mitglied m ;

INSERT INTO Zahlung (mitglied_id, beitrag, datum, zahlungsart) VALUES
    (1, 100.00, DATE('now'), 'Überweisung'),
    (2, 50.00, DATE('now'), 'Kreditkarte'),
    (3, 200.00, DATE('now'), 'Barzahlung'),
    (1, 50.00, DATE('now'), 'Kreditkarte');
  
   SELECT * FROM Zahlung z ;
  
 
  CREATE TABLE Benachrichtigung (
 	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
 	mitglied_id INTEGER NOT NULL,
 	nachricht TEXT NOT NULL,
 	datum DATETIME NOT NULL DEFAULT CURRENT_TIMSTAMP,
 	FOREIGN KEY (mitglied_id) REFERENCES Mitglied(id)
 );


CREATE TABLE Mitgliedszahlung (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	mitglied_id INTEGER NOT NULL,
	jahr INTEGER NOT NULL,
	gesamt_bezahlt DECIMAL(10, 2) NOT NULL DEFAULT 0,
	FOREIGN KEY (mitglied_id) REFERENCES Mitglied(id)
);

INSERT INTO Benachrichtigung (mitglied_id, nachricht, datum) VALUES
    (1, 'Max Müller hat die Jahresgebühr vollständig bezahlt!', DATE('now')),
    (2, 'Lisa Schmidt hat 50€ eingezahlt.', DATE('now')),
    (3, 'Thomas Becker hat 200€ eingezahlt.', DATE('now'));

SELECT * FROM Benachrichtigung;


INSERT INTO Mitgliedszahlung (mitglied_id, jahr, gesamt_bezahlt) VALUES
    (1, 2024, 300.00),  -- Max Müller teljesen befizette az éves díjat
    (2, 2024, 50.00),   -- Lisa Schmidt 50€-t fizetett be
    (3, 2024, 200.00);  -- Thomas Becker 200€-t fizetett be

SELECT * FROM Mitgliedszahlung m ;

-- Archiváljuk az előző év befizetéseit
INSERT INTO Mitgliedszahlung (mitglied_id, jahr, gesamt_bezahlt)
SELECT id, strftime('%Y', 'now') - 1, gesamt_bezahlt
FROM Mitglied;

-- Visszaállítjuk a befizetéseket a következő évre
UPDATE Mitglied
SET gesamt_bezahlt = 0, jahr = jahr + 1;

SELECT * FROM Mitglied;
SELECT * FROM Mitgliedszahlung;

-- 1️⃣ Liste alle Mitglieder mit ihrer Jahresgebühr und den bereits gezahlten Beträgen auf.

SELECT m.Vorname || " " || m.Nachname as fullname, m.jahresgebühr, m.gesamt_bezahlt 
FROM Mitglied m; 

-- 2️ Liste alle Zahlungen mit Betrag, Datum und Zahlungsmethode auf.

SELECT z.beitrag, z.datum, z.zahlungsart FROM Zahlung z ;

-- Liste alle Mitglieder auf, die ihre Jahresgebühr vollständig bezahlt haben.

SELECT * FROM Mitglied m ;
SELECT * FROM Mitgliedszahlung m ;

SELECT m.Nachname , b.nachricht
FROM Benachrichtigung b 
RIGHT JOIN Mitglied m ON b.id = m.id 
WHERE nachricht LIKE '%vollständig%';

-- 4. Liste alle Mitglieder auf, die ihre Jahresgebühr noch nicht vollständig bezahlt haben.
SELECT * FROM Benachrichtigung b ;

SELECT m.Nachname , b.nachricht
FROM Benachrichtigung b 
RIGHT JOIN Mitglied m ON b.id = m.id 
WHERE nachricht LIKE '%eingezahlt%';



SELECT * FROM Mitglied m ;
SELECT * FROM Mitgliedszahlung m ;

SELECT m.Vorname || " " || m.Nachname AS Mitglied, m.jahresgebühr, m2.gesamt_bezahlt ,b.nachricht 
FROM Mitglied m 
INNER JOIN Mitgliedszahlung m2 ON m.id = m2.mitglied_id 
INNER JOIN Benachrichtigung b ON m.id = b.mitglied_id
WHERE m.jahresgebühr > m2.gesamt_bezahlt AND m2.gesamt_bezahlt > 0 ;



























