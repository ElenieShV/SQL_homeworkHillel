INSERT INTO Employees
(FirstName, LastName, Gender, BirthDate, Email, Phone, HireDate, Salary, DepartmentID, IsActive)
VALUES
('Ivan', 'Petrenko', 'M', '1990-05-12', 'ivan.petrenko@mail.com', '380501112233', '2020-03-01', 2500.00, 1, 1),
('Olena', 'Koval', 'F', '1995-09-20', 'olena.koval@mail.com', '380671234567', '2021-06-15', 2200.00, 2, 1),
('Andrii', 'Shevchenko', 'M', '1988-01-03', 'andrii.shev@mail.com', '380931234567', '2019-11-10', 3000.00, 1, 0);

SELECT * FROM Employees;
