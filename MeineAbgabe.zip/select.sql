-- Aufgabe 2: Wer ist Hobbit und besitzt den Ring?
SELECT name FROM Characters WHERE race = 'Hobbit' AND name = 'Frodo Baggins';

-- Aufgabe 3: Der Ring wechselt den Besitzer zu Gandalf (INSERT)
INSERT INTO Participation (character_id, battle_id, outcome) VALUES
    ((SELECT id FROM Characters WHERE name = 'Gandalf'), NULL, 'Received Ring');

-- Aufgabe 6: Charaktere, die an bestimmten Ereignissen teilgenommen haben
SELECT c.name, c.race
FROM Characters c
JOIN Participation p ON c.id = p.character_id
WHERE p.battle_id = (SELECT id FROM Battles WHERE name = 'Battle of Helm''s Deep');

