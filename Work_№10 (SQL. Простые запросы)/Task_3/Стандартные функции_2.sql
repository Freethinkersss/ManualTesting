-- DROP DATABASE shop;

CREATE DATABASE shop; -- Создаем базу данных "Магазин"

USE shop; -- Выбираем базу данных "Магазин" для последующих операций

CREATE TABLE categories -- Создаем таблицу "Категории"
(
	id INT AUTO_INCREMENT PRIMARY KEY, -- Присваиваем основной ключ для таблицы "Категории"
    name VARCHAR(255) NOT NULL UNIQUE -- Создаем поле "Имя", которое должно быть уникальным не может быть пустым
);

CREATE TABLE products -- Создаем таблицу "Продукты"
(
	id INT AUTO_INCREMENT PRIMARY KEY, -- Присваиваем основной ключ для таблицы "Продукты"
    name VARCHAR(255) NOT NULL UNIQUE, -- Создаем поле, которое должно быть уникальным и не может быть пустым
    price DECIMAL(10, 2) NOT NULL, -- Задаем цену продукта
    categoryId INT NOT NULL, -- Создаем поле "ID катогерии"
    dateOfManufacture DATE NOT NULL,
    FOREIGN KEY (categoryId) REFERENCES categories(id) -- Связываем внешние ключи между таблицами "Продукты" и "Категории"
);

INSERT INTO categories(name) -- Создаем строки в таблице "Категории" 
VALUES ('Овощи'), ('Фрукты'), ('Кондитерские изделия'), ('Бытовая химия'), ('Алкоголь');

INSERT INTO products(name, price, categoryId, dateOfManufacture) -- Создаем строки в таблице "Продукты"
VALUE ('Картофель красный', 60, 1, '2021-09-15'),
	('Порошок Tide 2,5 кг', 450, 4, '2020-02-20'),
	('Бананы', 80, 2, '2022-02-26'),
    ('Вафли Яшкино', 95, 3, '2021-12-06'),
    ('Морковь мытая', 80, 1, '2021-08-19'),
    ('Салфетки Zewa', 50, 4, '2020-11-17'),
    ('Водка Grey Goose', 2300, 5, '2018-05-13');

-- Выводим список товаров с отдельными полями "День", "Месяц", "Год".
SELECT name, DAY(dateOfManufacture), MONTH(dateOfManufacture), YEAR(dateOfManufacture)
FROM products;

-- Выводим количество товаров по годам.
SELECT YEAR(dateOfManufacture), COUNT(*)
FROM products
GROUP BY YEAR(dateOfManufacture);