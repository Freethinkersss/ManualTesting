-- Выбираеи базу данных.
USE world;

-- Названия континентов, на которых есть страны с площадью не менее 950000.
SELECT DISTINCT continent
FROM country
WHERE surfaceArea >= 950000;

-- Получить первые 5 стран с наибольшей площадью.
SELECT name
FROM country
ORDER BY surfaceArea DESC
LIMIT 5;

-- Получить страны, которые занимают 6-10 места по площади включительно.
SELECT name
FROM country
ORDER BY surfaceArea DESC
LIMIT 5, 5;