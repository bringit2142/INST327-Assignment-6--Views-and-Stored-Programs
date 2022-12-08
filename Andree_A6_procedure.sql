USE ischool_v2;

DROP PROCEDURE IF EXISTS classes_for_student;

DELIMITER //
CREATE PROCEDURE classes_for_student (
		fname_param VARCHAR(50),
        lname_param VARCHAR(50)
	)

BEGIN
		SELECT DISTINCT CONCAT(fname,' ', lname) AS student_name, department, 
			CONCAT(course_code, ' ', course_number) AS course_name, 
            CONCAT(semester, ' ', section_number) AS section, credits, course_description, 
            start_time, building_code, room_number
		FROM people
        JOIN enrollments USING(person_id)
        JOIN course_sections USING(section_id)
        JOIN courses USING(course_id)
        JOIN locations USING(location_id)
        WHERE fname = fname_param AND lname = lname_param
        ORDER BY course_name;

END //

DELIMITER ;

-- --> Run the statement below to test your code: 
CALL classes_for_student('Dustin', 'Nguyen')

-- --> Do you see the rows with the following values? Column names should match the names outlined above. 
	-- 		Dustin Nguyen	BSIS	INST 101	1	Fall 0101	Bits and Bytes of Computer and Information Sciences	13:00:00	IRB	1207
	-- 		Dustin Nguyen	BSIS	INST 314	3	Fall 0201	Statistics for Information Science	14:00:00	HBK	109
	-- 		Dustin Nguyen	BSIS	INST 327	3	Fall 01xx	Database Design and Modeling	11:00:00	ATL	2324
	-- 		Dustin Nguyen	BSIS	INST 362	3	Fall 0103	User-Centered Design	14:00:00	ESJ	2208
-- --> If "Yes", you have built the stored procedure as required; 
-- --- if "No", continue working on it.

-- --> If you would like to test the output with different output you simply need to replace 'Dustin' and 'Nguyen' 
-- --> with any other student in the database. Please note some may return 0 which means they are not students!
-- --- SELECT DISTINCT fname, lname FROM people;

