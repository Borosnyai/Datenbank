-- Dokumentation der Ringbesitzerwechsel
CREATE TABLE RingOwnership (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    character_id INTEGER NOT NULL,
    start_date TEXT NOT NULL,
    end_date TEXT NULL,
    FOREIGN KEY (character_id) REFERENCES Characters(id)
);

-- Frodo besitzt den Ring
INSERT INTO RingOwnership (character_id, start_date, end_date)
VALUES ((SELECT id FROM Characters WHERE name = 'Frodo Baggins'), '3001-09-22', '3019-03-25');

-- Ring geht zu Gandalf
UPDATE RingOwnership SET end_date = '3019-03-15' WHERE character_id = (SELECT id FROM Characters WHERE name = 'Frodo Baggins');
INSERT INTO RingOwnership (character_id, start_date)
VALUES ((SELECT id FROM Characters WHERE name = 'Gandalf'), '3019-03-15');
