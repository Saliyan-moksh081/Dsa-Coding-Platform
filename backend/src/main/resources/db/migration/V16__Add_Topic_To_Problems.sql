ALTER TABLE problems ADD COLUMN topic VARCHAR(255);
UPDATE problems SET topic = 'General' WHERE topic IS NULL;
