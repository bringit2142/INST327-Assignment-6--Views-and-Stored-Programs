USE ischool_v2;
DROP VIEW IF EXISTS student_addresses;

CREATE VIEW student_addresses AS
SELECT CONCAT(lname, ', ', fname) AS 'person', pronoun, department, 
	CONCAT(street, ' ', city, ', ', state) AS "Location Address", classification
FROM people
	JOIN person_addresses USING(person_id)
	JOIN addresses USING(address_id)
    JOIN person_pronoun USING(person_id)
    JOIN pronouns USING(pronoun_id)
	JOIN person_classifications USING(person_id)
	JOIN classification USING(classification_id)
WHERE classification = 'Student' AND CONCAT(street, ' ', city, ', ', state) IS NOT NULL
ORDER BY department, person;


SELECT * FROM student_addresses


    
    