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
    price DECIMAL(10,2) NOT NULL, -- Задаем цену продукта
    categoryId INT NOT NULL, -- Создаем поле "ID катогерии"
    FOREIGN KEY (categoryId) REFERENCES categories(id) -- Связываем внешние ключи между таблицами "Продукты" и "Категории"
);

INSERT INTO categories(name) -- Создаем строки в таблице "Категории" 
VALUES ('Овощи'), ('Фрукты'), ('Кондитерские изделия'), ('Бытовая химия'), ('Алкоголь');

INSERT INTO products(name, price, categoryId) -- Создаем строки в таблице "Продукты"
VALUE ('Картофель красный', 60, 1),
	('Порошок Tide 2,5 кг', 450, 4),
	('Бананы', 80, 2),
    ('Вафли Яшкино', 95, 3),
    ('Морковь мытая', 80, 1),
    ('Салфетки Zewa', 50, 4),
    ('Водка Grey Goose', 2300, 5);

DELETE FROM products -- Удаляем продукты с ценой свыше 100
WHERE price > 100;

UPDATE products -- Обновляем цену и название товара под ID=1
SET price = price / 2, name = 'Картофель местный'
WHERE id = 1; 