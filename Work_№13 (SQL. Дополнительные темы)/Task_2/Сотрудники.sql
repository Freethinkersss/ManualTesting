DROP DATABASE staff;

CREATE DATABASE staff;

USE staff;

CREATE TABLE department
( 
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE employee
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    department_id INT NOT NULL,
    chief_id INT NULL,
	name VARCHAR(100) NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (chief_id) REFERENCES employee(id)
);

INSERT INTO department(name)
VALUES ('Отдел тестирования ПО'),
	('Отдел разработки ПО'),
    ('Отдел аналитики'),
    ('Отдел поддержки');

INSERT INTO employee(name, salary, department_id, chief_id)
VALUES ('Путин А.А.', 180000, 1, NULL),
	('Мишустин А.А.', 177000, 2, NULL),
    ('Медведев А.А.', 175000, 3, NULL),
    ('Егоров Е.Е.', 110000, 1, 1),
    ('Артемов А.А.', 125000, 1, 1),
    ('Пашин П.П.', 175000, 2, 2),
    ('Иванов И.И..', 185000, 2, 2),
    ('Петров П.П.', 140000, 3, 3),
    ('Никитин Н.Н.', 140000, 3, 3),
    ('Александров А.А', 100000, 1, NULL),
    ('Неяскин П.Ю.', 105000, 2, NULL);
    

-- Запрос 1. Вывести список сотрудников в формате: Сотрудник, Отдел сотрудника, Руководитель, Отдел руководителя.
SELECT e.name, e_d.name AS employeeDepartment, chief.name AS chiefName, c_d.name AS chiefDepartment
FROM employee AS e
INNER JOIN department AS e_d
	ON e.department_id = e_d.id
LEFT JOIN employee AS chief
	ON e.chief_id = chief.id
INNER JOIN department AS c_d
	ON e.department_id = c_d.id;
    
-- Запрос 2. Вывести список сотрудников, получающих заработную плату, большую чем у непосредственного руководителя
SELECT e.name
FROM employee AS e
INNER JOIN employee AS chief
	ON e.chief_id = chief.id
WHERE e.salary > chief.salary;

-- Запрос 3. Вывести список сотрудников, получающих максимальную заработную плату в своем отделе.
SELECT employees.name 
FROM employee AS employees
WHERE employees.salary = (SELECT MAX(salary) 
						  FROM employee AS e 
						  WHERE e.department_id = employees.department_id);

-- Запрос 4. Вывести список ID отделов, количество сотрудников в которых не превышает 3 человек.
SELECT d.id
FROM department AS d
LEFT JOIN employee AS e
	ON d.id = e.department_id
GROUP BY d.id
HAVING COUNT(e.id) <= 3;

-- Запрос 5. Вывести список сотрудников, не имеющих назначенного руководителя, работающего в том же отделе.
SELECT e.name
FROM employee AS e
LEFT JOIN employee AS chief
	ON (chief.id = e.chief_id AND chief.department_id = e.department_id)
WHERE chief.id IS NULL;

-- Запрос 6. Вывести список наименований отделов с максимальной суммарной зарплатой сотрудников.
SELECT d.name, SUM(salary) AS maxSumSalary 
FROM department AS d
INNER JOIN employee AS e
	ON d.id = e.department_id
GROUP BY d.name;

-- Запрос 7. Вывести ФИО сотрудника(ов), получающего третью по величине зарплату в организации.
/* 
SELECT name, salary
FROM employee
ORDER BY salary DESC
LIMIT 2, 1; 
*/
-- по этому запросу в ступоре.