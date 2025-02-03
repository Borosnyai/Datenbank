/*Kikapcsolja az idegen kulcsokat*/
PRAGMA foreign_keys = OFF;
/*Ha tabla letezik,akkor töröli*/
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Billing;
DROP TABLE IF EXISTS WaitingList;


CREATE TABLE Patient(
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	birth_date DATE NOT NULL,
	adress TEXT NOT NULL,
	telefon TEXT NOT NULL,
	email TEXT NOT NULL
);

INSERT INTO Patient (first_name, last_name, birth_date, adress, telefon, email)
VALUES 
    ('Anna', 'Kovács', '1985-04-12', 'Budapest, Kossuth u. 10.', '+36201234567', 'anna.kovacs@email.com'),
    ('Péter', 'Nagy', '1992-08-23', 'Debrecen, Petőfi tér 5.', '+36301112233', 'peter.nagy@email.com'),
    ('Laura', 'Szabó', '1978-11-30', 'Szeged, Arany János u. 15.', '+36205556677', 'laura.szabo@email.com'),
    ('Gábor', 'Tóth', '2000-06-15', 'Győr, Bartók Béla út 3.', '+36303334455', 'gabor.toth@email.com');

   

 
CREATE TABLE Doctor(
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	specialty TEXT NOT NULL,
	telefon TEXT NOT NULL,
	email TEXT NOT NULL
);

ALTER TABLE Patient
ADD COLUMN national_insurancecard TEXT DEFAULT 'UNKNOWN' NOT NULL;

UPDATE Patient 
SET national_insurancecard = 'HUN-12345678'
WHERE id = 1;

UPDATE Patient SET national_insurancecard = 'HUN-23456789' WHERE id = 2;
UPDATE Patient SET national_insurancecard = 'HUN-34567890' WHERE id = 3;
UPDATE Patient SET national_insurancecard = 'HUN-45678901' WHERE id = 4;



  SELECT * FROM Patient p ;
 
 CREATE TABLE Appointment(
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	patient_id INTEGER NOT NULL,
	doctor_id INTEGER NOT NULL,
	appointment_date DATETIME NOT NULL,
	status TEXT CHECK(status IN ('Scheduled', 'Completed', 'Cancelled')) DEFAULT 'Scheduled',
	FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
	FOREIGN KEY (patient_id) REFERENCES Patient(id)
 );

INSERT INTO Appointment (patient_id, doctor_id, appointment_date, status)
VALUES 
    (1, 2, '2024-02-05 09:00:00', 'Scheduled'),
    (2, 3, '2024-02-06 10:30:00', 'Scheduled'),
    (3, 1, '2024-02-07 14:00:00', 'Completed'),
    (4, 4, '2024-02-08 11:15:00', 'Cancelled');



SELECT * FROM Patient p ;
SELECT * FROM Doctor d ;
SELECT * FROM Appointment a ;

INSERT INTO Doctor (first_name, last_name, specialty, telefon, email)
VALUES 
    ('Márta', 'Bodnár', 'Fogorvos', '+36201234567', 'marta.bodnar@hospital.com'),
    ('István', 'Szalai', 'Szemész', '+36202223344', 'istvan.szalai@hospital.com'),
    ('Kata', 'Molnár', 'Ortopédus', '+36303334455', 'kata.molnar@hospital.com'),
    ('Tamás', 'Varga', 'Sebész', '+36404445566', 'tamas.varga@hospital.com');


CREATE TABLE Billing (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	patient_id INTEGER NOT NULL,
	amount REAL NOT NULL,
	status TEXT CHECK(status IN ('Pending','Paid')) DEFAULT 'Pending',
	invoice_date DATE DEFAULT CURRENT_DATE,
	FOREIGN KEY (patient_id) REFERENCES Patient(id)
);

INSERT INTO Billing (patient_id, amount, status, invoice_date)
VALUES 
    (1, 20000, 'Pending', '2024-02-01'),
    (2, 35000, 'Paid', '2024-01-28'),
    (3, 15000, 'Pending', '2024-01-30'),
    (4, 50000, 'Paid', '2024-01-25');

 
SELECT * FROM Billing;

CREATE TABLE WaitingList(
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	patient_id INTEGER NOT NULL,
	preferred_date DATE NOT NULL,
	status TEXT CHECK(status IN('Waiting', 'Notified', 'Scheduled')) DEFAULT 'Waiting',
	FOREIGN KEY (patient_id) REFERENCES Patient(id)
);

INSERT INTO WaitingList (patient_id, preferred_date, status)
VALUES 
    (1, '2024-02-10', 'Waiting'),
    (2, '2024-02-12', 'Notified'),
    (3, '2024-02-08', 'Waiting'),
    (4, '2024-02-14', 'Scheduled');

SELECT * FROM WaitingList;

UPDATE WaitingList SET status = 'Notified' WHERE status = 'Notifeid';




INSERT INTO Doctor (first_name, last_name, specialty, telefon, email)
VALUES
('John', 'Dhoe', 'kardiologus', '13456789235', 'john.dhoe@hospital.com');

/*Listázd ki az összes páciens nevét és születési dátumát!*/
SELECT p.first_name || " " ||  p.last_name AS full_name, p.birth_date 
FROM Patient p ;

SELECT * FROM Doctor d ;

-- Listázd ki azon orvosok nevét és szakterületét, akik kardiológusok!
SELECT d.first_name || " " || d.last_name AS full_name , d.specialty
FROM Doctor d
WHERE specialty = 'kardiologus';


-- Listázd ki azon páciensek nevét és biztosítási számát, akiknek van időpontjuk a "Scheduled" státuszban!
SELECT p.first_name || " " || p.last_name as full_name, p.national_insurancecard 
FROM Patient p 
INNER JOIN Appointment a  ON p.id = a.patient_id 
WHERE status = 'Scheduled';

SELECT * FROM WaitingList wl ;


SELECT * FROM Patient p ;

-- Számold meg, hány számla van, ami még nincs kifizetve ("Pending" státusz)!
SELECT COUNT(b.status) FROM Billing b 
WHERE b.status = 'Pending';

-- Listázd ki az összes időpontot dátum szerint növekvő sorrendben!

SELECT a.appointment_date 
FROM Appointment a ;

-- Csoportosítsd a számlákat státusz szerint, és add meg, hogy hány számla tartozik az egyes státuszokhoz!

SELECT b.status, COUNT(b.invoice_date) FROM Billing b 
GROUP BY b.status ;

-- 7. Feladat: WaitingList lekérdezés
-- Listázd ki azon páciensek nevét és preferált időpontját, akik még várólistán vannak ("Waiting" státusz)!

SELECT p.first_name || " " || p.last_name as full_name, wl.preferred_date 
FROM Patient p
INNER JOIN WaitingList wl ON p.id = wl.patient_id 
WHERE status = 'Waiting';

SELECT * FROM WaitingList wl ;













