-- DROP DATABASE shop;

-- Создаем базу данных "Магазин"
CREATE DATABASE shop;

-- Выбираем базу данных "Магазин" для последующих операций
USE shop;

-- Создаем таблицу "Категории"
CREATE TABLE categories
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- Создаем таблицу "Продукты"
CREATE TABLE products 
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    price DECIMAL(10, 2) NOT NULL,
    categoryId INT NOT NULL,
    FOREIGN KEY (categoryId) REFERENCES categories(id)
);

-- Напишем хранимую процедуру для таблиц.
DELIMITER $$

CREATE PROCEDURE fillTables()

BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE j INT DEFAULT 1;
    
    WHILE i <= 100 DO
		INSERT INTO categories (name)
		VALUES (CONCAT('Категория ', i));
        
		SET i = i + 1;
	END WHILE;
    
	WHILE j <= 5000 DO
		INSERT INTO products (name, price, categoryId)
		VALUES (CONCAT('Продукт ', j), FLOOR(10 + (RAND() * 2500)), FLOOR(1 + (RAND() * 100)));
        
		SET j = j + 1;
    END WHILE;
END$$

DELIMITER ;

-- Вызвать процедуру.
CALL fillTables();

-- DROP PROCEDURE fillTable;