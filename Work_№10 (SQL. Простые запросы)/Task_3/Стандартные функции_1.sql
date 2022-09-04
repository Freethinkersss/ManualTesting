-- Выбираем базу World.
USE world;

-- Выведите страны в порядке убывания длины названия. И пусть название страны будет в верхнем регистре, а название континента - в нижнем. 
SELECT CHAR_LENGTH(name) AS nameLenght, LOWER(continent) AS continentLower, UPPER(name) AS nameUpper
FROM country
ORDER BY nameLenght DESC;

-- Для каждой страны найдите радиус окружности, у которой площадь круга такая же, как площадь этой страны. Отсортируйте результат по убыванию радиуса.
SELECT name, SQRT(surfaceArea / PI()) AS radius
FROM country
ORDER BY radius DESC;