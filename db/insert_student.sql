INSERT INTO student_data
    (student, cohort, campus_id)
VALUES
    ($1, $2, $3);

SELECT * FROM student_data;