PRAGMA foreign_keys = OFF;
DROP TABLE IF EXISTS Characters;
DROP TABLE IF EXISTS Places;
DROP TABLE IF EXISTS Battles;
DROP TABLE IF EXISTS Participation;


CREATE TABLE Characters (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	race TEXT NOT NULL,
	weapon INTEGER NOT NULL,
	affiliation TEXT NOT NULL
);

CREATE TABLE Places (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	region TEXT NOT NULL,
	description TEXT NOT NULL
);

CREATE TABLE Battles (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	place_id INTEGER NOT NULL,
	date TEXT NOT NULL,
	FOREIGN KEY (place_id) REFERENCES Places (id)
);

CREATE TABLE Participation (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    character_id INTEGER NOT NULL,
    battle_id INTEGER NOT NULL,
    outcome TEXT,
    FOREIGN KEY (character_id) REFERENCES Characters(id),
    FOREIGN KEY (battle_id) REFERENCES Battles(id)
);

INSERT INTO Characters (name, race, weapon, affiliation)
VALUES 
    ('Frodo Baggins', 'Hobbit', 1, 'Good'),
    ('Aragorn', 'Human', 1, 'Good'),
    ('Legolas', 'Elf', 1, 'Good'),
    ('Gimli', 'Dwarf', 1, 'Good'),
    ('Gandalf', 'Wizard', 1, 'Good'),
    ('Sauron', 'Maia', 1, 'Evil'),
    ('Saruman', 'Wizard', 1, 'Evil'),
    ('Gollum', 'Hobbit', 0, 'Neutral');

SELECT * FROM "Characters" c ;

INSERT INTO Places (name, region, description)
VALUES 
    ('Shire', 'Eriador', 'A hobbitok otthona, békés vidék.'),
    ('Rivendell', 'Eriador', 'Az elfek menedéke, Elrond háza.'),
    ('Moria', 'Misty Mountains', 'Ősi törp bányák, Balrog lakhelye.'),
    ('Helm''s Deep', 'Rohan', 'A rohaniak egyik legnagyobb erődje.'),
    ('Mordor', 'East', 'Sauron birodalma, a Gonosz központja.'),
    ('Mount Doom', 'Mordor', 'A Végzet Hegye, itt készült a Gyűrű.');


   
 
INSERT INTO Battles (name, place_id, date)
VALUES 
    ('Battle of Helm''s Deep', 4, '3019-03-03'),
    ('Battle of Pelennor Fields', 5, '3019-03-15'),
    ('Siege of Minas Tirith', 5, '3019-03-09'),
    ('Battle of the Black Gate', 5, '3019-03-25');


 INSERT INTO Participation (character_id, battle_id, outcome)
VALUES 
    (2, 1, 'Victory'),  -- Aragorn Helm's Deep-nél harcolt és győzött
    (3, 1, 'Victory'),  -- Legolas Helm's Deep-nél harcolt és győzött
    (4, 1, 'Victory'),  -- Gimli Helm's Deep-nél harcolt és győzött
    (2, 2, 'Victory'),  -- Aragorn a Pelennor Mezőn harcolt és győzött
    (5, 3, 'Victory'),  -- Gandalf Minas Tirith ostrománál harcolt
    (6, 4, 'Defeat');   -- Sauron a Fekete Kapunál végül vesztett

SELECT * FROM Participation p ;
SELECT * FROM "Characters" c ;
SELECT * FROM Battles b ;





