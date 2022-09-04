-- Выбираеи базу данных.
USE world;

-- Попробовать CROSS JOIN между таблицами городов и стран.
SELECT * FROM city, country;

-- При помощи INNER JOIN: вывести код страны, название страны и название города-столицы.
SELECT country.code, country.name, country.capital AS capitalId, city.name AS capitalName
FROM country
INNER JOIN city
	ON country.capital = city.id;

-- Сделайте запрос, который выводит имя города, его численность, а также код и название его страны.
SELECT city.name, city.population, country.code, country.name
FROM city
INNER JOIN country
	ON city.countryCode = country.code;

-- Для каждого континента выведите количество городов из этого континента. Учтите, что в Антарктиде городов нет, но надо чтобы все равно вывелся 0.
SELECT country.continent, COUNT(city.id) AS citiesCount
FROM country
LEFT JOIN city
	ON country.code = city.countryCode
GROUP BY country.continent; 

-- Выведите количество официальных языков для каждой страны в порядке убывания количества этих языков.
SELECT c.name, COUNT(cl.isOfficial) AS officialLanguagesCount
FROM country AS c
LEFT JOIN countrylanguage AS cl
	ON c.code = cl.countryCode AND cl.isOfficial = 'T'
GROUP BY c.name
ORDER BY officialLanguagesCount DESC; 