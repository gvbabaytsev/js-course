
-- Создаем БД shop. В случае наличие уже созданной БД shop, можно удалить БД командой "DROP DATABASE IF EXISTS shop";
CREATE DATABASE shop
    WITH
    OWNER = postgres
    ENCODING = 'UTF8';

--Переключаемся на БД shop("\c shop"), далее создаем схемы.
CREATE SCHEMA IF NOT EXISTS employees;

CREATE SCHEMA IF NOT EXISTS  customers;

CREATE SCHEMA IF NOT EXISTS  products;

--Создаем таблицы
CREATE TABLE IF NOT EXISTS employees.employee(
	employee_id BIGSERIAL PRIMARY KEY,
	employee_full_name VARCHAR NOT NULL,
	phone_number VARCHAR UNIQUE NOT NULL,
	employee_email TEXT UNIQUE CHECK (employee_email ~ '\A\S+@\S+\.\S+\Z'),
	employee_birthday DATE NOT NULL,
	employee_passport_data TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS customers.customer(
	customer_id BIGSERIAL PRIMARY KEY,
	customer_full_name VARCHAR NOT NULL,
	phone_number VARCHAR UNIQUE NOT NULL,
	customer_email TEXT UNIQUE CHECK (employee_email ~ '\A\S+@\S+\.\S+\Z'),
	customer_birthday DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS products.product(
	 product_id BIGSERIAL PRIMARY KEY,
	 product_name VARCHAR UNIQUE NOT NULL,
	 product_description TEXT,
	 price INTEGER,
	 weight INTEGER,
	 manufacturer_country VARCHAR NOT NULL
);




