-- Выбираем базу данных World
USE world;

-- Вывести все страны вместе с количеством городов;
SELECT countryCode, COUNT(*)
FROM city
GROUP BY countryCode;

-- Вывести все страны вместе с количеством городов, оставить только страны, в которых не менее 2 городов.
SELECT countryCode, COUNT(*)
FROM city
GROUP BY countryCode
HAVING COUNT(*) >= 2;

-- Вывести все страны вместе с количеством городов, в которых не менее 1 млн человек, оставить только страны, в которых не менее 2 таких городов.
SELECT countryCode, COUNT(*)
FROM city
WHERE population >= 1000000
GROUP BY countryCode
HAVING COUNT(*) >= 2;

-- Найти среднюю численность населения городов по каждой стране, вывести в порядке убывания.
SELECT countryCode, AVG(population) average
FROM city
GROUP BY countryCode
ORDER BY average DESC;