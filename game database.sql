DROP DATABASE IF EXISTS sports_game_db;

CREATE DATABASE sports_game_db;

USE sports_game_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT NOT NULL,
    department VARCHAR(50),
    year_of_study INT,
    email VARCHAR(100) UNIQUE,
    CHECK (age >= 5 AND age <= 100)
);


CREATE TABLE games (
    game_id INT PRIMARY KEY AUTO_INCREMENT,
    game_name VARCHAR(50) NOT NULL UNIQUE,
    game_type VARCHAR(30),
    team_or_individual VARCHAR(20)
);

CREATE TABLE tournaments (
    tournament_id INT PRIMARY KEY AUTO_INCREMENT,
    tournament_name VARCHAR(100) NOT NULL,
    tournament_level VARCHAR(30) NOT NULL,
    country VARCHAR(50),
    year INT,
    game_id INT,

    CONSTRAINT fk_tournament_game
        FOREIGN KEY (game_id)
        REFERENCES games(game_id)
);

CREATE TABLE participation (
    participation_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    tournament_id INT,
    participation_status VARCHAR(30),

    CONSTRAINT fk_participation_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_participation_tournament
        FOREIGN KEY (tournament_id)
        REFERENCES tournaments(tournament_id)
);

CREATE TABLE medals (
    medal_id INT PRIMARY KEY AUTO_INCREMENT,
    participation_id INT,
    medal_type VARCHAR(20),

    CONSTRAINT fk_medal_participation
        FOREIGN KEY (participation_id)
        REFERENCES participation(participation_id)
);


INSERT INTO games (game_name, game_type, team_or_individual)
VALUES
('Cricket', 'Outdoor', 'Team'),
('Football', 'Outdoor', 'Team'),
('Badminton', 'Indoor', 'Individual'),
('Basketball', 'Indoor', 'Team'),
('Athletics', 'Outdoor', 'Individual');

SELECT * FROM games;

INSERT INTO students
(student_name, gender, age, department, year_of_study, email)
VALUES
('Arjun Kumar', 'Male', 18, 'CSE', 2, 'arjun@gmail.com'),
('Rahul Varma', 'Male', 20, 'AIML', 3, 'rahul@gmail.com'),
('Priya Sharma', 'Female', 19, 'ECE', 2, 'priya@gmail.com'),
('Sneha Reddy', 'Female', 21, 'CSE', 4, 'sneha@gmail.com'),
('Kiran Kumar', 'Male', 17, 'AIML', 1, 'kiran@gmail.com'),
('Anjali Rao', 'Female', 18, 'EEE', 2, 'anjali@gmail.com'),
('Vijay Singh', 'Male', 22, 'CSE', 4, 'vijay@gmail.com'),
('Meena Devi', 'Female', 20, 'AIML', 3, 'meena@gmail.com'),
('Rohit Das', 'Male', 19, 'ECE', 2, 'rohit@gmail.com'),
('Divya Patel', 'Female', 23, 'CSE', 4, 'divya@gmail.com'),
('Suresh Babu', 'Male', 16, 'AIML', 1, 'suresh@gmail.com'),
('Lakshmi Priya', 'Female', 17, 'ECE', 1, 'lakshmi@gmail.com'),
('Manoj Kumar', 'Male', 24, 'CSE', 4, 'manoj@gmail.com'),
('Keerthi Reddy', 'Female', 19, 'AIML', 2, 'keerthi@gmail.com'),
('Ajay Krishna', 'Male', 21, 'ECE', 3, 'ajay@gmail.com');


SELECT * FROM students;


INSERT INTO tournaments
(tournament_name, tournament_level, country, year, game_id)
VALUES
('University Cricket Championship', 'College', 'India', 2026, 1),

('National Cricket Championship', 'National', 'India', 2026, 1),

('International Cricket Cup', 'International', 'Australia', 2026, 1),

('State Football Championship', 'State', 'India', 2026, 2),

('International Football Cup', 'International', 'Brazil', 2026, 2),

('National Badminton Championship', 'National', 'India', 2026, 3),

('International Badminton Open', 'International', 'Japan', 2026, 3),

('University Basketball Tournament', 'College', 'India', 2026, 4),

('International Basketball Championship', 'International', 'USA', 2026, 4),

('National Athletics Meet', 'National', 'India', 2026, 5),

('International Athletics Championship', 'International', 'France', 2026, 5);


SELECT * FROM tournaments;


INSERT INTO participation
(student_id, tournament_id, participation_status)
VALUES
(1, 1, 'Participated'),
(2, 2, 'Participated'),
(3, 3, 'Participated'),
(4, 5, 'Participated'),
(5, 1, 'Participated'),
(6, 7, 'Participated'),
(7, 9, 'Participated'),
(8, 6, 'Participated'),
(9, 10, 'Participated'),
(10, 11, 'Participated'),
(11, 4, 'Participated'),
(12, 8, 'Participated'),
(13, 3, 'Participated'),
(14, 7, 'Participated'),
(15, 11, 'Participated');

INSERT INTO medals
(participation_id, medal_type)
VALUES
(1, 'Gold'),
(2, 'Silver'),
(3, 'Gold'),
(4, 'Bronze'),
(5, 'Silver'),
(6, 'Gold'),
(7, 'Silver'),
(8, 'Gold'),
(9, 'Bronze'),
(10, 'Gold');

SELECT * FROM students;

SELECT *
FROM students
WHERE age > 18;

SELECT *
FROM students
WHERE department = 'AIML';

SELECT *
FROM students
WHERE gender = 'Female';

SELECT *
FROM students
ORDER BY age ASC;

SELECT *
FROM students
ORDER BY age DESC;

SELECT *
FROM students
WHERE student_id = 5;

DELETE FROM participation
WHERE participation_id = 15;

ALTER TABLE students
ADD phone VARCHAR(15);

DESC students;

SELECT
    t.tournament_name,
    t.tournament_level,
    g.game_name
FROM tournaments t
JOIN games g
ON t.game_id = g.game_id;


SELECT
    s.student_name,
    t.tournament_name,
    t.tournament_level
FROM students s
INNER JOIN participation p
    ON s.student_id = p.student_id
INNER JOIN tournaments t
    ON p.tournament_id = t.tournament_id;
    
    SELECT
    s.student_name,
    g.game_name,
    t.tournament_name
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN tournaments t
    ON p.tournament_id = t.tournament_id
JOIN games g
    ON t.game_id = g.game_id;
    
    
    SELECT
    s.student_name,
    g.game_name,
    t.tournament_name,
    t.country
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN tournaments t
    ON p.tournament_id = t.tournament_id
JOIN games g
    ON t.game_id = g.game_id
WHERE t.tournament_level = 'International';

SELECT
    s.student_name,
    g.game_name,
    t.tournament_name,
    m.medal_type
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN tournaments t
    ON p.tournament_id = t.tournament_id
JOIN games g
    ON t.game_id = g.game_id
JOIN medals m
    ON p.participation_id = m.participation_id
WHERE t.tournament_level = 'International';

SELECT COUNT(DISTINCT s.student_id) AS international_medal_winners
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN tournaments t
    ON p.tournament_id = t.tournament_id
JOIN medals m
    ON p.participation_id = m.participation_id
WHERE t.tournament_level = 'International';


SELECT
    s.student_name,
    g.game_name,
    t.tournament_name
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN tournaments t
    ON p.tournament_id = t.tournament_id
JOIN games g
    ON t.game_id = g.game_id
JOIN medals m
    ON p.participation_id = m.participation_id
WHERE m.medal_type = 'Gold';


SELECT
    s.student_name,
    g.game_name,
    t.tournament_name,
    m.medal_type
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN tournaments t
    ON p.tournament_id = t.tournament_id
JOIN games g
    ON t.game_id = g.game_id
JOIN medals m
    ON p.participation_id = m.participation_id
WHERE t.tournament_level = 'International'
AND m.medal_type = 'Gold';


SELECT
    medal_type,
    COUNT(*) AS total_medals
FROM medals
GROUP BY medal_type;



SELECT
    g.game_name,
    COUNT(m.medal_id) AS total_medals
FROM games g
JOIN tournaments t
    ON g.game_id = t.game_id
JOIN participation p
    ON t.tournament_id = p.tournament_id
JOIN medals m
    ON p.participation_id = m.participation_id
GROUP BY g.game_name;


SELECT
    g.game_name,
    COUNT(m.medal_id) AS international_medals
FROM games g
JOIN tournaments t
    ON g.game_id = t.game_id
JOIN participation p
    ON t.tournament_id = p.tournament_id
JOIN medals m
    ON p.participation_id = m.participation_id
WHERE t.tournament_level = 'International'
GROUP BY g.game_name;



SELECT
    student_id,
    student_name,
    age,
    department
FROM students
WHERE age BETWEEN 18 AND 25;


SELECT COUNT(*) AS eligible_students
FROM students
WHERE age BETWEEN 18 AND 25;


SELECT COUNT(*) AS not_eligible_students
FROM students
WHERE age NOT BETWEEN 18 AND 25;


SELECT
    s.student_name,
    s.age,
    g.game_name,
    t.tournament_name,
    m.medal_type
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN tournaments t
    ON p.tournament_id = t.tournament_id
JOIN games g
    ON t.game_id = g.game_id
JOIN medals m
    ON p.participation_id = m.participation_id
WHERE s.age BETWEEN 18 AND 25
AND t.tournament_level = 'International';


SELECT COUNT(DISTINCT s.student_id) AS eligible_medal_winners
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN tournaments t
    ON p.tournament_id = t.tournament_id
JOIN medals m
    ON p.participation_id = m.participation_id
WHERE s.age BETWEEN 18 AND 25
AND t.tournament_level = 'International';



SELECT
    COUNT(DISTINCT s.student_id) AS eligible_students,
    COUNT(DISTINCT CASE
        WHEN t.tournament_level = 'International'
        AND m.medal_id IS NOT NULL
        THEN s.student_id
    END) AS international_medal_winners
FROM students s
LEFT JOIN participation p
    ON s.student_id = p.student_id
LEFT JOIN tournaments t
    ON p.tournament_id = t.tournament_id
LEFT JOIN medals m
    ON p.participation_id = m.participation_id
WHERE s.age BETWEEN 18 AND 25;



SELECT
    g.game_name,
    COUNT(DISTINCT s.student_id) AS eligible_students
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN tournaments t
    ON p.tournament_id = t.tournament_id
JOIN games g
    ON t.game_id = g.game_id
WHERE s.age BETWEEN 18 AND 25
GROUP BY g.game_name;


SELECT
    g.game_name,
    COUNT(DISTINCT s.student_id) AS medal_winners
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN tournaments t
    ON p.tournament_id = t.tournament_id
JOIN games g
    ON t.game_id = g.game_id
JOIN medals m
    ON p.participation_id = m.participation_id
WHERE t.tournament_level = 'International'
GROUP BY g.game_name;



SELECT
    s.student_id,
    s.student_name
FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM participation p
    JOIN medals m
        ON p.participation_id = m.participation_id
    WHERE p.student_id = s.student_id
);



SELECT
    s.student_name,
    COUNT(m.medal_id) AS total_medals
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN medals m
    ON p.participation_id = m.participation_id
GROUP BY s.student_id, s.student_name
HAVING COUNT(m.medal_id) > 1;



CREATE VIEW student_sports_view AS
SELECT
    s.student_id,
    s.student_name,
    s.age,
    s.department,
    g.game_name,
    t.tournament_name,
    t.tournament_level
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN tournaments t
    ON p.tournament_id = t.tournament_id
JOIN games g
    ON t.game_id = g.game_id;
    
    
    SELECT * FROM student_sports_view;
    
    
    CREATE VIEW international_medal_view AS
SELECT
    s.student_name,
    s.age,
    g.game_name,
    t.tournament_name,
    t.country,
    m.medal_type
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN tournaments t
    ON p.tournament_id = t.tournament_id
JOIN games g
    ON t.game_id = g.game_id
JOIN medals m
    ON p.participation_id = m.participation_id
WHERE t.tournament_level = 'International';


SELECT * FROM international_medal_view;

CREATE VIEW eligible_students_view AS
SELECT
    student_id,
    student_name,
    age,
    department,
    year_of_study
FROM students
WHERE age BETWEEN 18 AND 25;


SELECT * FROM eligible_students_view;


SELECT
    g.game_name,
    COUNT(m.medal_id) AS total_medals
FROM games g
JOIN tournaments t
    ON g.game_id = t.game_id
JOIN participation p
    ON t.tournament_id = p.tournament_id
JOIN medals m
    ON p.participation_id = m.participation_id
GROUP BY g.game_name
HAVING COUNT(m.medal_id) >= 2;



SELECT DISTINCT department
FROM students;

SELECT DISTINCT tournament_level
FROM tournaments;


SELECT *
FROM students
WHERE student_name LIKE 'A%';


SELECT *
FROM students
WHERE student_name LIKE '%Kumar%';


SELECT *
FROM students
WHERE age BETWEEN 18 AND 21;



SELECT *
FROM students
WHERE department IN ('CSE', 'AIML');



SELECT
    student_name,
    age,
    CASE
        WHEN age BETWEEN 18 AND 25 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility
FROM students;


SELECT
    student_name,
    age
FROM students
WHERE age > (
    SELECT AVG(age)
    FROM students
);

SELECT MAX(age) AS maximum_age
FROM students;

SELECT MIN(age) AS minimum_age
FROM students;


SELECT ROUND(AVG(age), 2) AS average_age
FROM students;


SELECT COUNT(*) AS total_students
FROM students;

SELECT COUNT(*) AS total_games
FROM games;


SELECT COUNT(*) AS total_tournaments
FROM tournaments;


SELECT COUNT(DISTINCT participation_id) AS medal_winners
FROM medals;


SELECT
    tournament_level,
    COUNT(*) AS total_tournaments
FROM tournaments
GROUP BY tournament_level;


DESC students;
DESC games;
DESC tournaments;
DESC participation;
DESC medals;


SELECT
    s.student_id,
    s.student_name,
    s.age,
    s.department,
    g.game_name,
    t.tournament_name,
    t.tournament_level,
    t.country,
    m.medal_type
FROM students s
LEFT JOIN participation p
    ON s.student_id = p.student_id
LEFT JOIN tournaments t
    ON p.tournament_id = t.tournament_id
LEFT JOIN games g
    ON t.game_id = g.game_id
LEFT JOIN medals m
    ON p.participation_id = m.participation_id
ORDER BY s.student_id;

SELECT
    s.student_name,
    g.game_name,
    t.tournament_name
FROM students s
INNER JOIN participation p
    ON s.student_id = p.student_id
INNER JOIN tournaments t
    ON p.tournament_id = t.tournament_id
INNER JOIN games g
    ON t.game_id = g.game_id;
    
    
    SELECT
    s.student_name,
    p.participation_id,
    p.participation_status
FROM students s
RIGHT JOIN participation p
ON s.student_id = p.student_id;


SELECT
    s.student_name,
    g.game_name
FROM students s
CROSS JOIN games g;


SELECT
    s1.student_name AS student1,
    s2.student_name AS student2,
    s1.department
FROM students s1
JOIN students s2
    ON s1.department = s2.department
    AND s1.student_id < s2.student_id;
    
    
    SELECT
    s.student_name,
    g.game_name,
    t.tournament_name,
    t.country
FROM students s
JOIN participation p
    ON s.student_id = p.student_id
JOIN tournaments t
    ON p.tournament_id = t.tournament_id
JOIN games g
    ON t.game_id = g.game_id
WHERE t.tournament_level = 'International';


