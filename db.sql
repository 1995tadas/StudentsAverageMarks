DROP PROCEDURE IF EXISTS marks.students_medium;

DELIMITER $$
CREATE PROCEDURE marks.students_medium()

BEGIN
SELECT
university.name AS "Universiteto pavadinimas",
CONCAT(student.first_name,' ',student.last_name) AS "Vardas Pavardė",
FORMAT(AVG(CASE WHEN subject.code = "discrete_mathematics" THEN mark.mark END),1,'lt_LT')  AS "Diskrečioji matematika",
FORMAT(AVG(CASE WHEN subject.code = "object_oriented_programming" THEN mark.mark END),1,'lt_LT') "Objektinis programavimas",
FORMAT(AVG(CASE WHEN subject.code = "philosophy" THEN mark.mark END),1,'lt_LT') "Filosofija",
FORMAT(AVG(CASE WHEN subject.code = "english" THEN mark.mark END),1,'lt_LT') "Anglų k.",
FORMAT(AVG(CASE WHEN subject.code = "project_management" THEN mark.mark END),1,'lt_LT') "Projektų valdymas"
FROM mark
JOIN subject ON subject.id = mark.subject_id
JOIN student ON mark.student_id = student.id
JOIN university ON student.university_id = university.id
GROUP BY student_id;
END $$

DELIMITER ;

CALL marks.students_medium;
