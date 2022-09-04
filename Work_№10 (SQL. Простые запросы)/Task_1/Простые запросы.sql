-- Выбираеи базу данных.
USE world;

-- Вывести все строки , но только столбцы имя и дистрикт.
SELECT name, district 
FROM city;

-- Вывести города только из России, отсортируйте по имени.
SELECT * FROM city
WHERE countryCode = 'RUS'
ORDER BY name;

-- Выведите города из Испании, Португалии и Греции, отсортируйте по имени по убыванию.
SELECT * FROM city
WHERE countryCode IN ('ESP', 'PRT', 'GRC') 
ORDER BY name DESC;

-- Вывести города, у которых население лежит в диапазоне от 300000 до 500000.
SELECT * FROM city
WHERE population BETWEEN 300000 AND 500000;

-- Вывести города, начинающиеся с буквы А.
SELECT * FROM city
WHERE name LIKE 'A%';

-- Вывести города, содержащие букву А.
SELECT * FROM city
WHERE name LIKE '%A%';

-- Вывести города из России с населением не менее 1 млн.
SELECT * FROM city
WHERE countryCode = 'RUS' AND population >= 1000000;

-- Вывести города из Испании, начинающиеся с буквы А, и города из Греции с численностью до 200000 человек.
SELECT * FROM city
WHERE (countryCode = 'ESP' AND name LIKE 'A%') 
	OR (countryCode = 'GRC' AND population <= 200000);