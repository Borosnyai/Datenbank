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
