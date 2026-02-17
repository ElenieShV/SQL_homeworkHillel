--CREATE DATABASE [University]
--GO
--USE [University]
--GO
CREATE TABLE [StudentsMarks]
(
    [Id] INT IDENTITY PRIMARY KEY,
    [FirstName] NVARCHAR(30) NOT NULL,
    [LastName] NVARCHAR(30) NOT NULL,
    [MiddleName] NVARCHAR(30),
    [City] NVARCHAR(20),
    [Country] NVARCHAR(20),
    [BirthDate] DATE NOT NULL,
    [Email] VARCHAR(50),
    [PhoneNumber] VARCHAR(20),
    [GroupName] NVARCHAR(20) NOT NULL,
    [AverageMark] TINYINT,
    [LowestMarkSubject] NVARCHAR(20),
    [HighestMarkSubject] NVARCHAR(20)
)
GO
-- TRUNCATE TABLE [StudentsMarks]
INSERT INTO [StudentsMarks] (
  [FirstName]
, [LastName]
, [MiddleName]
, [City]
, [Country]
, [BirthDate]
, [Email]
, [PhoneNumber]
, [GroupName]
, [AverageMark]
, [LowestMarkSubject]
, [HighestMarkSubject])
VALUES 
(N'John', N'Smith', N'Steven', N'New York', N'USA', '2000-05-15', 'john.smith@gmail.com', '+1 (123) 456-7890', N'Group A', 85, N'Mathematics', N'History'),
(N'Elena', N'Sidorova', N'Alexandra', N'   Los Angeles', N'LS', '2001-02-20', 'elena.sidorova@example.com', '+1 (987) 654-3210', N'Group B', 78, N'Physics', N'Literature'),
(N'Andrew', N'Ivanov', NULL, N'Chicago', N'USA', '2000-09-10', 'andrew.ivanov@gmail.com', '+1 (312) 555-1234', N'Group A', 92, N'Chemistry', N'Mathematics'),
(N'Maria', N'Smirnova', N'Vasylivna', N'  Miami  ', N'USA', '2001-04-05', NULL, '+1 (305) 789-5678', N'Group C', 70, N'Foreign Language', N'Physics'),
(N'Paul', N'Kozlov', N'Igorovich', N'Houston', N'USA', '2000-11-30', 'paul.kozlov@example.com', '+1 (713) 987-6543', N'Group D', NULL, N'Computer Science', N'Chemistry'),
(N'Emily', N'Johnson', N'Michelle', N'   San Francisco', N'USA', '2000-08-12', 'emily.johnson@example.com', '+1 (415) 123-4567', N'Group A', 90, N'Computer Science', N'English'),
(N'Daniel', N'Williams', N'Robert', N'Boston', N'Boston', '2001-03-25', 'daniel.williams@example.com', '+1 (617) 987-6543', N'Group B', 82, N'History', N'Chemistry'),
(N'Olivia', N'Miller', N'Grace', N'Washington, D.C.   ', N'USA', '2000-11-05', NULL, '+1 (202) 555-7890', N'Group C', 75, N'Literature', N'Mathematics'),
(N'William', N'Jones', N'Henry', N'  Chicago  ', N'USA', '2001-06-18', 'william.jones@gmail.com', '+1 (312) 555-4321', N'Group D', 88, N'Physics', N'Computer Science'),
(N'Ava', N'Brown', N'Elizabeth', N'Los Angeles', N'LS', '2000-09-30', 'ava.brown@gmail.com', '+1 (213) 987-3210', N'Group A', 79, N'Foreign Language', N'History'),
(N'Anna', N'Dou', NULL, N'Los Angeles', N'USA', '2001-12-30', 'anna.dou@gmail.com', '+1 (213) 387-3514', N'Group A', NULL, N'Physics', N'History'),
(N'Vin', N'Dizel', NULL, N'Boston', N'Boston', '2002-04-20', 'vin.dizel@gmail.com', '+1 (213) 987-3210', N'Group A', 79, N'Foreign Language', N'Chemistry'),
(N'Bret', N'Pit', NULL, N'Washington, D.C.    ', N'USA', '2000-02-25', 'b.pit@gmail.com', '+1 (202) 564-3216', N'Group C', NULL, N'Computer Science', N'History');

 


--1. Середній бал по групі: 
SELECT
  GroupName,
  AVG(CAST(AverageMark AS float)) AS AvgMark
FROM StudentsMarks
GROUP BY GroupName;


--2. Максимальний бал: 
SELECT MAX(AverageMark) AS MaxMark
FROM StudentsMarks;


--3. Мінімальний бал:
SELECT MIN(AverageMark) AS MinMark
FROM StudentsMarks;


--4. Середній вік студентів (тут треба використовувати декілька функцій //спойрел :) одна із них DATEDIFF)
	-- алгоритм: спочатку знаходите різницю між [BirthDate] і сьогоднішним днем в роках а потім обертаемо в функцію пошуку середнього значення :
  SELECT
  AVG(CAST(DATEDIFF(year, BirthDate, GETDATE()) AS float)) AS AvgAge
FROM StudentsMarks;


--5. Кількість студентів із пропущеними оцінками:
SELECT COUNT(*) AS StudentsWithNullMarks
FROM StudentsMarks
WHERE AverageMark IS NULL;


--6. Наймолодший студент (вивести поля FirstName, LastName, BirthDate):
SELECT TOP 1 FirstName, LastName, BirthDate
FROM StudentsMarks
ORDER BY BirthDate DESC;


--7. Кількість студентів з електронною поштою:
SELECT COUNT(*) AS StudentsWithEmail
FROM StudentsMarks
WHERE Email IS NOT NULL;


--8. Пошук довжини рядка (вивести FirstName і друге поле довжина FirstName):
SELECT FirstName, LEN(FirstName) AS FirstNameLength
FROM StudentsMarks;


--9. Перетворення рядка у верхній регістр (вивести LastName і друге поле LastName у верхньому регістрі):
SELECT LastName, UPPER(LastName) AS LastNameUpper
FROM StudentsMarks;


--10. Перетворення рядка в нижній регістр (вивести LastName і друге поле FirstName у нижньому регістрі):
SELECT LastName, LOWER(FirstName) AS FirstNameLower
FROM StudentsMarks;


--11. Видалення початкових і кінцевих пробілів в полі City:
SELECT City, LTRIM(RTRIM(City)) AS CityTrimmed
FROM StudentsMarks;


--12. Витяг підрядка (з поля Email витягти підрядок 10 символів починаю с 1 індекса  //SUBSTRING):
SELECT Email, SUBSTRING(COALESCE(Email, ''), 1, 10) AS EmailPart10
FROM StudentsMarks;


--13. Поиск позиции подстроки (на якій позиції знаходиться підстрока "gmail" в полі Email, вивести два поля Email і позіцию):
SELECT Email, CHARINDEX('gmail', COALESCE(Email, '')) AS GmailPosition
FROM StudentsMarks;


--14. Заміна підрядка (в полі PhoneNumber замінити '-' на ''(пусте значення), вивести два поля PhoneNumber і нове поле з заміною):
SELECT PhoneNumber, REPLACE(COALESCE(PhoneNumber, ''), '-', '') AS PhoneNoDashes
FROM StudentsMarks;


--15. Конкатенація рядків (зробить конкатинацію рядків FirstName, LastName та в дужках день народження  //CONCAT ):
SELECT
  CONCAT(FirstName, ' ', LastName, ' (', CONVERT(varchar(10), BirthDate, 23), ')') AS FullInfo
FROM StudentsMarks;


--16. Вивести FirstName, LastName, вік студента, та в який день тижня в нього день народження:
SELECT
  FirstName,
  LastName,
  DATEDIFF(year, BirthDate, GETDATE()) AS Age,
  DATENAME(weekday, BirthDate) AS BirthDayName
FROM StudentsMarks;


--17. Вивести одним полем (через пробіл) поля FirstName, LastName та Email
SELECT
  CONCAT(FirstName, ' ', LastName, ' ', COALESCE(Email, '')) AS OneLine
FROM StudentsMarks;


--18. Знайдіть усі групи, які мають більше 2 студентів
SELECT GroupName, COUNT(*) AS StudentsCount
FROM StudentsMarks
GROUP BY GroupName
HAVING COUNT(*) > 2;


--19. Визначте групи, в яких середній бал студентів нижчеабо орівнює 80
SELECT GroupName, AVG(CAST(AverageMark AS float)) AS AvgMark
FROM StudentsMarks
GROUP BY GroupName
HAVING AVG(CAST(AverageMark AS float)) <= 80;


--20. Знайти середній бал студентів у кожній групі, але показати лише ті групи, де середній бал більше 70. (враховуйте те що AverageMark може буди null)
SELECT GroupName, AVG(CAST(AverageMark AS float)) AS AvgMark
FROM StudentsMarks
GROUP BY GroupName
HAVING AVG(CAST(AverageMark AS float)) > 70;


--21. Вивести студенка і його контакті данні, якщо нема телефона то виводити e-mail, як що нема жодного то вивести "контакти відсутні"
SELECT
  FirstName,
  LastName,
  CASE
    WHEN PhoneNumber IS NOT NULL THEN PhoneNumber
    WHEN Email IS NOT NULL THEN Email
    ELSE N'контакти відсутні'
  END AS ContactInfo
FROM StudentsMarks;


--22. Вивести студенка і його середній бал, якщо немає то вивести "оцінки відсутні"
SELECT
  FirstName,
  LastName,
  CASE
    WHEN AverageMark IS NULL THEN N'оцінки відсутні'
    ELSE CAST(AverageMark AS varchar(10))
  END AS MarkInfo
FROM StudentsMarks;


--23. Кількість студентів у кожній групі: 
SELECT GroupName, COUNT(*) AS StudentsCount
FROM StudentsMarks
GROUP BY GroupName;


--24. Статистика за країнами (Country і кількість студентів): 
SELECT Country, COUNT(*) AS StudentsCount
FROM StudentsMarks
GROUP BY Country;


--25. Пошук ASCII-коду першого символу в імені:
SELECT FirstName, ASCII(LEFT(FirstName, 1)) AS FirstCharAscii
FROM StudentsMarks;

