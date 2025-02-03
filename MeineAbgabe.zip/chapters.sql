-- Schreibe eine Abfrage, die Namen und die Rasse aller Charactekre ausgibt, die an keinen Ereignis teilgenommen haben und nichts besitzen.

SELECT c.name, c.race, b.name AS battle_name
FROM Characters c
JOIN Participation p ON c.id = p.character_id
JOIN Battles b ON p.battle_id = b.id
WHERE b.name = 'Battle of Helm''s Deep';
