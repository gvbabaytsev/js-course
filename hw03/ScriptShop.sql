
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
CREATE TABLE IF NOT EXISTS employees.post(
	post_id BIGSERIAL PRIMARY KEY,
	name VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS employees.employee(
	employee_id BIGSERIAL PRIMARY KEY,
	full_name VARCHAR NOT NULL,
	phone_number VARCHAR UNIQUE NOT NULL,
	email TEXT UNIQUE CHECK (email ~ '\A\S+@\S+\.\S+\Z'),
	birthday DATE NOT NULL,
	passport_data TEXT NOT NULL,
	post_id BIGSERIAL,
	FOREIGN KEY (post_id) REFERENCES employees.post (post_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS customers.customer(
	customer_id BIGSERIAL PRIMARY KEY,
	full_name VARCHAR NOT NULL,
	phone_number VARCHAR UNIQUE NOT NULL,
	email TEXT UNIQUE CHECK (email ~ '\A\S+@\S+\.\S+\Z'),
	birthday DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS products.product(
	 product_id BIGSERIAL PRIMARY KEY,
	 name VARCHAR UNIQUE NOT NULL,
	 description TEXT,
	 price INTEGER,
	 weight INTEGER,
	 manufacturer_country VARCHAR NOT NULL
);




