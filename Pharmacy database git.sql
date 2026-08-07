CREATE DATABASE Pharmacy;
use pharmacy;

CREATE TABLE Tablets(
Tablet_ID INT PRIMARY KEY,
Tablet_Name VARCHAR(50),
Tablet_Weight DECIMAL(5,2),
Disease VARCHAR(50),
Symptom VARCHAR(50)
);

INSERT INTO Tablets VALUES
(1,'Paracetamol',500,'Fever','Headache'),
(2,'Cetirizine',10,'Allergy','Sneezing'),
(3,'Azithromycin',250,'Infection','Cough'),
(4,'Pantoprazole',40,'Acidity','Heartburn'),
(5,'ORS',200,'Dehydration','Weakness');

select*from Tablets;

ALTER TABLE Tablets ADD column Cost DECIMAL(8,2);

ALTER TABLE Tablets RENAME COLUMN Cost TO Tablet_Cost;

UPDATE Tablets SET Tablet_Cost=20 WHERE Tablet_ID=1;
UPDATE Tablets SET Tablet_Cost=15 WHERE Tablet_ID=2;
UPDATE Tablets SET Tablet_Cost=120 WHERE Tablet_ID=3;
UPDATE Tablets SET Tablet_Cost=35 WHERE Tablet_ID=4;
UPDATE Tablets SET Tablet_Cost=25 WHERE Tablet_ID=5;

ALTER TABLE Tablets MODIFY Tablet_Weight DECIMAL(6,2);

ALTER TABLE Tablets ADD Age_Group VARCHAR(20);

select*from Tablets;

UPDATE Tablets SET Age_Group='All Ages';

DESC Tablets;

UPDATE Tablets
SET Age_Group = 'Children'
WHERE Tablet_ID = 1;

UPDATE Tablets
SET Age_Group = 'Adults'
WHERE Tablet_ID = 2;

UPDATE Tablets
SET Age_Group = 'Adults'
WHERE Tablet_ID = 3;

UPDATE Tablets
SET Age_Group = 'Adults'
WHERE Tablet_ID = 4;

UPDATE Tablets
SET Age_Group = 'All Ages'
WHERE Tablet_ID = 5;


ALTER TABLE Tablets DROP COLUMN Tablet_Weight;

select*from Tablets;

select count(*) AS Age_Group from Tablets;

SELECT COUNT(*) FROM Tablets;

select tablet_cost,max(tablet_cost) AS maximum_tablet_cost
from Tablets
group by tablet_cost;

select tablet_cost,min(tablet_cost) AS minimum_tablet_cost
from Tablets
group by tablet_cost;

select tablet_cost,avg(tablet_cost) AS average_tablet_cost
from Tablets
group by tablet_cost;

SELECT MIN(Tablet_Cost),MAX(Tablet_Cost),AVG(Tablet_Cost),SUM(Tablet_Cost) FROM Tablets;

SELECT Disease,MIN(Tablet_Cost) FROM Tablets GROUP BY Disease HAVING MIN(Tablet_Cost)>10;
ALTER TABLE Tablets ADD Tablet_Weight DECIMAL(6,2);
select*from tablets;

UPDATE Tablets SET Tablet_Weight = 500 WHERE Tablet_ID = 1;
UPDATE Tablets SET Tablet_Weight = 10 WHERE Tablet_ID = 2;
UPDATE Tablets SET Tablet_Weight = 250 WHERE Tablet_ID = 3;
UPDATE Tablets SET Tablet_Weight = 40 WHERE Tablet_ID = 4;
UPDATE Tablets SET Tablet_Weight = 200 WHERE Tablet_ID = 5;

ALTER TABLE Tablets ADD Quantity INT;

UPDATE Tablets SET Quantity = 10 WHERE Tablet_ID = 1;
UPDATE Tablets SET Quantity = 20 WHERE Tablet_ID = 2;
UPDATE Tablets SET Quantity = 15 WHERE Tablet_ID = 3;
UPDATE Tablets SET Quantity = 30 WHERE Tablet_ID = 4;
UPDATE Tablets SET Quantity = 25 WHERE Tablet_ID = 5;

SELECT 
    Tablet_Name,
    Tablet_Weight,
    Quantity,
    (Tablet_Weight * Quantity) AS Total_Weight,
    (Quantity + 5) AS Addition_Op,
    (Quantity - 2) AS Subtraction_Op,
    (Quantity * 2) AS Multiplication_Op,
    (Quantity / 2) AS Division_Op,
    (Quantity % 3) AS Modulo_Op
FROM Tablets;

select*from tablets;


-- Equal to (=)
SELECT * FROM Tablets WHERE Age_Group = 'Adults';

-- Greater than (>)
SELECT * FROM Tablets WHERE Tablet_Cost > 30;

-- Less than (<)
SELECT * FROM Tablets WHERE Quantity < 20;

-- Greater than or equal to (>=)
SELECT * FROM Tablets WHERE Tablet_Weight >= 200;

-- Less than or equal to (<=)
SELECT * FROM Tablets WHERE Tablet_Cost <= 25;

-- Not equal to (!= or <>)
SELECT * FROM Tablets WHERE Disease != 'Fever';




-- AND: True if all conditions separated by AND are TRUE
SELECT * FROM Tablets WHERE Age_Group = 'Adults' AND Tablet_Cost > 20;

-- OR: True if any of the conditions separated by OR is TRUE
SELECT * FROM Tablets WHERE Symptom = 'Headache' OR Symptom = 'Sneezing';

-- NOT: Displays a record if the condition is NOT TRUE
SELECT * FROM Tablets WHERE NOT Age_Group = 'Children';

-- IN: True if the operand is equal to one of a list of expressions
SELECT * FROM Tablets WHERE Tablet_ID IN (1, 3, 5);

-- BETWEEN: True if the operand is within a range of comparisons
SELECT * FROM Tablets WHERE Tablet_Cost BETWEEN 20 AND 100;

-- LIKE: True if the operand matches a pattern (e.g., starts with 'P')
SELECT * FROM Tablets WHERE Tablet_Name LIKE 'P%';

-- IS NULL / IS NOT NULL: Tests for empty (NULL) values
SELECT * FROM Tablets WHERE Symptom IS NOT NULL;

SELECT 
    Tablet_ID, 
    Quantity,
    (Tablet_ID & Quantity) AS Bitwise_AND,
    (Tablet_ID | Quantity) AS Bitwise_OR,
    (Tablet_ID ^ Quantity) AS Bitwise_XOR
FROM Tablets;

SELECT Tablet_Name, Tablet_ID
FROM Tablets
WHERE Symptom = 'Headache' OR Symptom = 'Sneezing';

SELECT Tablet_ID, Tablet_Name, Tablet_Weight
FROM Tablets
WHERE Age_Group = 'Adults' AND Tablet_Cost > 20;











