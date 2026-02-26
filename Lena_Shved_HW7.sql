USE master;
GO
DROP DATABASE CarOwners;
GO

CREATE DATABASE [CarOwners]
GO

USE [CarOwners]
GO

--DROP TABLE IF EXISTS Fines;
--DROP TABLE IF EXISTS Inspections;
--DROP TABLE IF EXISTS Owners;
--DROP TABLE IF EXISTS Cars;

-- Перевірити всі лі ключи присутні!!!! Як що треба то додати.

-- Створення таблиці Cars
CREATE TABLE Cars (
	CarID INT PRIMARY KEY
,	Brand NVARCHAR(50)
,	Model NVARCHAR(50)
,	Year INT
,	EngineSize INT
,	Price DECIMAL(10, 2)
,	OwnerID INT
);

-- Створення таблиці Owners
CREATE TABLE Owners (
	OwnerID INT PRIMARY KEY
,	OwnerName NVARCHAR(100)
);

-- Створення таблиці Inspections
CREATE TABLE Inspections (
	InspectionID INT PRIMARY KEY
,	CarID INT
,	InspectionDate DATE
,	FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

-- Створення таблиці Fines (штрафи)
CREATE TABLE Fines (
	FineID INT PRIMARY KEY
,	CarID INT
,	FineAmount DECIMAL(10, 2)
,	FineDate DATE
,	FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

INSERT INTO Owners (OwnerID, OwnerName)
VALUES 
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Mark Johnson'),
(4, 'Emily Davis'),
(5, 'Michael Brown'),
(6, 'Sophia Wilson'),
(7, 'William Taylor'),
(8, 'Olivia Anderson'),
(9, 'James Martinez'),
(10, 'Emma Thomas'),
(11, 'Alexander Hernandez'),
(12, 'Mia Moore'),
(13, 'Benjamin Jackson'),
(14, 'Charlotte Lee'),
(15, 'Daniel Perez'),
(16, 'Amelia White'),
(17, 'Matthew Harris'),
(18, 'Harriet Clark'),
(19, 'Joseph Lewis'),
(20, 'Evelyn Young');


INSERT INTO Cars (CarID, Brand, Model, Year, EngineSize, Price, OwnerID)
VALUES 
(1, 'Toyota', 'Corolla', 2020, 1800, 20000.00, 1),
(2, 'Honda', 'Civic', 2018, 1600, 18000.00, 2),
(3, 'Ford', 'Focus', 2019, 2000, 22000.00, 3),
(4, 'Nissan', 'Altima', 2021, 2500, 25000.00, 1),
(5, 'BMW', 'X5', 2017, 3000, 35000.00, 4),
(6, 'Audi', 'A4', 2020, 2000, 32000.00, 6),
(7, 'Mercedes', 'C-Class', 2019, 2200, 38000.00, 7),
(8, 'Volkswagen', 'Golf', 2021, 1600, 22000.00, 8),
(9, 'Hyundai', 'Tucson', 2022, 2400, 28000.00, 9),
(10, 'Kia', 'Sportage', 2018, 2000, 21000.00, 10),
(11, 'Mazda', 'CX-5', 2020, 2500, 30000.00, 11),
(12, 'Subaru', 'Forester', 2019, 1800, 27000.00, 12),
(13, 'Tesla', 'Model 3', 2021, 0, 45000.00, 13),
(14, 'Lexus', 'RX', 2017, 3500, 40000.00, 14),
(15, 'Jeep', 'Cherokee', 2020, 2400, 32000.00, 15),
(16, 'Volvo', 'XC60', 2022, 2000, 42000.00, 16),
(17, 'Porsche', 'Cayenne', 2018, 3000, 65000.00, 17),
(18, 'Chevrolet', 'Camaro', 2021, 3600, 38000.00, 18),
(19, 'Land Rover', 'Range Rover', 2019, 3000, 70000.00, 19),
(20, 'Fiat', '500', 2020, 1200, 15000.00, 20);


INSERT INTO Inspections (InspectionID, CarID, InspectionDate)
VALUES 
(1, 1, '2023-01-15'),
(2, 2, '2023-05-22'),
(3, 4, '2022-12-01'),
(4, 5, '2023-03-10'),
(5, 6, '2023-02-20'),
(6, 7, '2023-03-15'),
(7, 8, '2023-04-10'),
(8, 9, '2023-05-05'),
(9, 10, '2023-06-18'),
(10, 11, '2023-07-22'),
(11, 12, '2023-08-30'),
(12, 13, '2023-09-11'),
(13, 14, '2023-10-25'),
(14, 15, '2023-11-08'),
(15, 16, '2023-12-15'),
(16, 17, '2024-01-10'),
(17, 18, '2024-02-14'),
(18, 19, '2024-03-20'),
(19, 20, '2024-04-01'),
(20, 1, '2023-12-01'),  -- Додатковий огляд для авто #1
(21, 3, '2023-11-15'),  -- Перший огляд для авто #3
(22, 5, '2023-10-10'),  -- Додатковий огляд для авто #5
(23, 2, '2023-09-05'),  -- Додатковий огляд для авто #2
(24, 4, '2023-08-20');  -- Додатковий огляд для авто #4


INSERT INTO Fines (FineID, CarID, FineAmount, FineDate)
VALUES 
(1, 2, 150.00, '2023-04-01'),
(2, 3, 200.00, '2023-07-18'),
(3, 1, 100.00, '2023-02-05'),
(4, 5, 300.00, '2023-06-22'),
(5, 6, 170.00, '2023-03-01'),
(6, 7, 230.00, '2023-04-15'),
(7, 8, 90.00, '2023-05-22'),
(8, 9, 300.00, '2023-06-10'),
(9, 10, 150.00, '2023-07-18'),
(10, 11, 210.00, '2023-08-05'),
(11, 12, 180.00, '2023-09-12'),
(12, 13, 500.00, '2023-10-20'),  -- Штраф для Tesla
(13, 14, 350.00, '2023-11-25'),
(14, 15, 200.00, '2023-12-08'),
(15, 16, 270.00, '2024-01-15'),
(16, 17, 450.00, '2024-02-20'),
(17, 18, 320.00, '2024-03-05'),
(18, 19, 600.00, '2024-04-10'),
(19, 20, 80.00, '2024-05-01'),
(20, 3, 180.00, '2023-12-15'),  -- Додатковий штраф для авто #3
(21, 1, 120.00, '2023-11-05'),  -- Додатковий штраф для авто #1
(22, 5, 250.00, '2023-10-18'),  -- Додатковий штраф для авто #5
(23, 2, 190.00, '2023-09-22'),  -- Додатковий штраф для авто #2
(24, 4, 280.00, '2023-08-30');  -- Штраф для авто #4




--1. Вивести всіх власників та їхні автомобілі (навіть якщо авто відсутні)
SELECT
    o.OwnerID,
    o.OwnerName,
    c.CarID,
    c.Brand,
    c.Model,
    c.Year,
    c.EngineSize,
    c.Price
FROM Owners o
LEFT JOIN Cars c ON c.OwnerID = o.OwnerID
ORDER BY o.OwnerName, c.CarID;

-- 2. Знайти автомобілі без техоглядів
SELECT
    c.CarID, c.Brand, c.Model, c.Year
FROM Cars c
LEFT JOIN Inspections i ON i.CarID = c.CarID
WHERE i.CarID IS NULL
ORDER BY c.CarID;

-- 3. Вивести загальну суму штрафів для кожного власника
SELECT
    o.OwnerID,
    o.OwnerName,
    COALESCE(SUM(f.FineAmount), 0) AS TotalFines
FROM Owners o
LEFT JOIN Cars c ON c.OwnerID = o.OwnerID
LEFT JOIN Fines f ON f.CarID = c.CarID
GROUP BY o.OwnerID, o.OwnerName
ORDER BY TotalFines DESC;

-- 4. Знайти останню дату техогляду для кожного авто (через підзапит)
SELECT
    c.CarID, c.Brand, c.Model, c.Year,
    (
        SELECT MAX(i.InspectionDate)
        FROM Inspections i
        WHERE i.CarID = c.CarID
    ) AS LastInspectionDate
FROM Cars c
ORDER BY c.CarID;

-- 5. Об'єднати інформацію про техогляди та штрафи
SELECT
    c.CarID,
    c.Brand,
    c.Model,
    i.InspectionDate AS EventDate,
    CAST(NULL AS DECIMAL(10,2)) AS FineAmount,
    'INSPECTION' AS EventType
FROM Cars c
JOIN Inspections i ON i.CarID = c.CarID

UNION ALL

SELECT
    c.CarID,
    c.Brand,
    c.Model,
    f.FineDate AS EventDate,
    f.FineAmount,
    'FINE' AS EventType
FROM Cars c
JOIN Fines f ON f.CarID = c.CarID
ORDER BY CarID, EventDate;

-- 6. Вивести власників, які не мають автомобілів
SELECT
    o.OwnerID,
    o.OwnerName
FROM Owners o
LEFT JOIN Cars c ON c.OwnerID = o.OwnerID
WHERE c.CarID IS NULL
ORDER BY o.OwnerName;


--7. Знайти автомобілі з техоглядом у 2023 році
SELECT DISTINCT
    c.CarID, c.Brand, c.Model, c.Year
FROM Cars c
JOIN Inspections i ON i.CarID = c.CarID
WHERE i.InspectionDate >= '2023-01-01'
  AND i.InspectionDate <  '2024-01-01'
ORDER BY c.CarID;

-- 8. Вивести кількість автомобілів кожного року випуску
SELECT
    c.Year,
    COUNT(*) AS CarsCount
FROM Cars c
GROUP BY c.Year
ORDER BY c.Year;

 -- 9. Знайти власників з штрафами > 100 грн
 SELECT DISTINCT
    o.OwnerID,
    o.OwnerName
FROM Owners o
JOIN Cars c ON c.OwnerID = o.OwnerID
JOIN Fines f ON f.CarID = c.CarID
WHERE f.FineAmount > 100
ORDER BY o.OwnerName;

-- 10. Вивести всі події (техогляди + штрафи) для авто #2
2 AS CarID,
    i.InspectionDate AS EventDate,
    CAST(NULL AS DECIMAL(10,2)) AS FineAmount,
    'INSPECTION' AS EventType
FROM Inspections i
WHERE i.CarID = 2

UNION ALL

SELECT
    2 AS CarID,
    f.FineDate AS EventDate,
    f.FineAmount,
    'FINE' AS EventType
FROM Fines f
WHERE f.CarID = 2
ORDER BY EventDate;

-- 11. Знайти авто, де рік випуску > 2018 і є штрафи
SELECT DISTINCT
    c.CarID, c.Brand, c.Model, c.Year
FROM Cars c
JOIN Fines f ON f.CarID = c.CarID
WHERE c.Year > 2018
ORDER BY c.CarID;

-- 12. Вивести кількість техоглядів для кожного авто
SELECT
    c.CarID, c.Brand, c.Model,
    COUNT(i.InspectionID) AS InspectionsCount
FROM Cars c
LEFT JOIN Inspections i ON i.CarID = c.CarID
GROUP BY c.CarID, c.Brand, c.Model
ORDER BY c.CarID;

-- 13. Знайти власників, чиї авто мають двигун > 2000 см?
SELECT DISTINCT
    o.OwnerID, o.OwnerName
FROM Owners o
JOIN Cars c ON c.OwnerID = o.OwnerID
WHERE c.EngineSize > 2000
ORDER BY o.OwnerName;


-- 14. Вивести всі авто з інформацією про останній техогляд (через підзапит)
SELECT
    c.CarID, c.Brand, c.Model, c.Year,
    (
        SELECT MAX(i.InspectionDate)
        FROM Inspections i
        WHERE i.CarID = c.CarID
    ) AS LastInspectionDate
FROM Cars c
ORDER BY c.CarID;


-- 15. Знайти авто без штрафів
SELECT
    c.CarID, c.Brand, c.Model, c.Year
FROM Cars c
LEFT JOIN Fines f ON f.CarID = c.CarID
WHERE f.CarID IS NULL
ORDER BY c.CarID;

-- 16. Вивести власників з кількістю авто та штрафів
SELECT
    o.OwnerID,
    o.OwnerName,
    COUNT(DISTINCT c.CarID) AS CarsCount,
    COUNT(f.FineID) AS FinesCount,
    COALESCE(SUM(f.FineAmount), 0) AS TotalFines
FROM Owners o
LEFT JOIN Cars c ON c.OwnerID = o.OwnerID
LEFT JOIN Fines f ON f.CarID = c.CarID
GROUP BY o.OwnerID, o.OwnerName
ORDER BY TotalFines DESC;


-- 17. Знайти найстаріший автомобіль у базі
SELECT TOP 1
    c.CarID, c.Brand, c.Model, c.Year
FROM Cars c
ORDER BY c.Year ASC, c.CarID ASC;

-- 18. Вивести середню ціну авто за рік випуску
SELECT
    c.Year,
    AVG(c.Price) AS AvgPrice
FROM Cars c
GROUP BY c.Year
ORDER BY c.Year;

-- 19. Знайти власників, де сума штрафів > середньої
;WITH OwnerTotals AS (
    SELECT
        o.OwnerID,
        o.OwnerName,
        COALESCE(SUM(f.FineAmount), 0) AS TotalFines
    FROM Owners o
    LEFT JOIN Cars c ON c.OwnerID = o.OwnerID
    LEFT JOIN Fines f ON f.CarID = c.CarID
    GROUP BY o.OwnerID, o.OwnerName
),
AvgTotal AS (
    SELECT AVG(CAST(TotalFines AS DECIMAL(10,2))) AS AvgFines
    FROM OwnerTotals
)
SELECT
    ot.OwnerID, ot.OwnerName, ot.TotalFines
FROM OwnerTotals ot
CROSS JOIN AvgTotal a
WHERE ot.TotalFines > a.AvgFines
ORDER BY ot.TotalFines DESC;

-- 20. Вивести всі авто з вказанням кількості техоглядів
SELECT
    c.CarID, c.Brand, c.Model, c.Year,
    COUNT(i.InspectionID) AS InspectionsCount
FROM Cars c
LEFT JOIN Inspections i ON i.CarID = c.CarID
GROUP BY c.CarID, c.Brand, c.Model, c.Year
ORDER BY c.CarID;



-- Додаткові СКЛАДНІ питання!!!! (не обов'язкові для виконання)
-- 21. Знайти власників, чиї автомобілі мають техогляди, але не мають штрафів
-- 22. Вивести автомобілі з кількістю техоглядів та загальною сумою штрафів
-- 23. Знайти рік з найбільшою кількістю техоглядів та штрафів
-- 24. Вивести власників, у яких всі автомобілі мають техогляди
-- 25. Знайти власників, чиї авто мають більше 1 техогляду та середній штраф понад 200 грн

