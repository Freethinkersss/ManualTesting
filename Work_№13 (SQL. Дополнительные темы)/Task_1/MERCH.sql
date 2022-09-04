USE merchandising;
-- 1) Выведите ФИО всех мерчендайзеров из сибирского региона.
SELECT firstName, lastName, middleName, c.name AS cityName
FROM merchandiser AS m
INNER JOIN city AS c
	ON m.cityId = c.id
WHERE c.regionId = 3;

-- 2) Выведите информацию о POSm, у которых не задан комментарий.
SELECT id, name, format, price, comment
FROM posmItem
WHERE comment IS NULL;

-- 3) Для каждого города выведите название города и число мерчендайзеров из этого города. Если там 0 мерчендайзеров, то должно вывестись 0.
SELECT c.name, COUNT(m.cityId) AS merchandiserCount
FROM city AS c
LEFT JOIN merchandiser AS m
	ON c.id = m.cityId
GROUP BY c.name;

-- 4) Для каждого региона выведите название региона и число мерчендайзеров из этого региона. Если там 0 мерчендайзеров, то должно вывестись 0.
SELECT r.name AS regionName, COUNT(m.id) AS merchandiserCount
FROM region AS r
LEFT JOIN city AS c
	ON r.id = c.regionId
LEFT JOIN merchandiser AS m
	ON c.id = m.cityId
GROUP BY r.name;

-- 5) Посчитайте сколько единиц каждого вида POsm еще осталось разместить и сколько было размещено.
SELECT pi.name, ppt.status AS taskStatus, SUM(psi.posmItemsCount * ppt.posmSetsCount) AS SumItems
FROM placePosmTask AS ppt
INNER JOIN formPosmSetTask AS fpst
	ON fpst.id = ppt.formPosmSetTaskId
INNER JOIN posmSetItem AS psi
	ON psi.posmSetId = fpst.posmSetId
RIGHT JOIN posmItem AS pi
	ON pi.id = psi.posmItemId
GROUP BY pi.name, ppt.status;

-- 6) Посчитайте сколько единиц каждого вида POSm было отправлено каждому агенту.
SELECT agentCode, pi.name AS itemName, SUM(ppt.posmSetsCount * psi.posmItemsCount) AS itemCount
FROM placePosmTask AS ppt
INNER JOIN formPosmSetTask AS fpst
	ON fpst.id = ppt.formPosmSetTaskId
INNER JOIN posmSetItem AS psi
	ON psi.posmSetId = fpst.posmSetId
RIGHT JOIN posmItem AS pi
	ON pi.id = psi.posmItemId
GROUP BY agentCode, pi.name
ORDER BY agentCode DESC;

-- 7) Посчитайте сколько у каждого мерчендайзера задач «в работе» и «выполнено». Если 0, то должно вывестись 0.
SELECT m.id AS merchandiserId, CONCAT(m.lastName, ' ', m.firstName, ' ', m.middleName) AS merchandiserFullName,
	COUNT(CASE WHEN ppt.status = 1 THEN 1 END) AS taskInProgress,
	COUNT(CASE WHEN ppt.status = 2 THEN 1 END) AS taskDone
FROM merchandiser AS m
LEFT JOIN placePosmTask AS ppt
	ON m.id = ppt.merchandiserId
GROUP BY m.id, CONCAT(m.lastName, ' ', m.firstName, ' ', m.middleName);

-- 8) Найдите агентов, у которых более 2 задач на размещение, выведите для каждого из них количество задач.
SELECT agentCode, COUNT(posmSetsCount) AS taskCount
FROM placeposmtask
GROUP BY agentCode
HAVING COUNT(posmSetsCount) > 2;