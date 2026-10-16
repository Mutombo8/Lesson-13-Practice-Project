CREATE TABLE IF NOT EXISTS students(
s_id INTEGER PRIMARY KEY NOT NULL,
    s_fname VARCHAR(100) NOT NULL,
    s_lname VARCHAR(100) NOT NULL,
    student_class INTEGER,
    age INTEGER
);

CREATE TABLE IF NOT EXISTS marksheet(
score INTEGER,
year INTEGER,
ranking INTEGER,
class INTEGER,
s_id INTEGER
);

INSERT INTO students(
s_id,
s_fname,
s_lname,
student_class,
age
)
VALUES
(1, 'krishna', 'gee', 10, 18),
(2, 'Stephen', 'Christ', 10, 17),
(3, 'Kailash', 'kumar', 10, 18),
(4, 'ashish', 'jain', 10, 16),
(5, 'khusbu', 'jain', 10, 17),
(6, 'madhan', 'lal', 10, 16),
(7, 'saurab', 'kothari', 10, 15),
(8, 'vinesh', 'roy', 10, 14),
(9, 'rishika', 'r', 10, 15),
(10, 'sara', 'rayan', 10, 16),
(11, 'rosy', 'kumar', 10, 16);

INSERT INTO marksheet(
score,
year,
ranking,
class,
s_id
)
VALUES
(989, 2014, 1, 10, 1),
(454, 2014, 10, 10, 2),
(880, 2014, 4, 10, 3),
(870, 2014, 5, 10, 4),
(720, 2014, 7, 10, 5),
(670, 2014, 8, 10, 6),
(900, 2014, 3, 10, 7),
(540, 2014, 9, 10, 8),
(801, 2014, 6, 10, 9),
(420, 2014, 11, 10, 10),
(970, 2014, 2, 10, 11),
(720, 2014, 12, 10, 12);

SELECT s_id, s_fname
FROM students
WHERE age >= 16
AND s_lname = 'kumar';

SELECT *
FROM marksheet
WHERE score BETWEEN 800 AND 1000;

SELECT *,
score + 5 AS new_score
FROM marksheet;

SELECT *
FROM marksheet
ORDER BY score DESC;

SELECT *
FROM students
WHERE s_fname LIKE 'a%';

--Top 5 students by score
SELECT
    s.s_fname,
    s.s_lname,
    m.score,
    m.ranking
FROM students AS s
INNER JOIN marksheet AS m
    ON s.s_id = m.s_id
ORDER BY m.score DESC
LIMIT 5;

--Overall class performance
SELECT
    COUNT(*) AS TotalResults,
    ROUND(AVG(score), 2) AS AverageScore,
    MAX(score) AS HighestScore,
    MIN(score) AS LowestScore
FROM marksheet;

--Identify missing student information
SELECT
    m.s_id,
    m.score,
    m.ranking
FROM marksheet AS m
LEFT JOIN students AS s
    ON m.s_id = s.s_id
WHERE s.s_id IS NULL;

