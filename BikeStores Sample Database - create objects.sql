/*
--------------------------------------------------------------------
© 2017 sqlservertutorial.net All Rights Reserved
--------------------------------------------------------------------
Name   : BikeStores
Link   : http://www.sqlservertutorial.net/load-sample-database/
Version: 1.0
--------------------------------------------------------------------
*/

SELECT @@hostname;
select user();
-- create schemas
CREATE SCHEMA production;
use production;

CREATE SCHEMA sales;
use sales;

-- create tables
-- CREATE TABLE production.categories (
-- 	category_id INT IDENTITY (1, 1) PRIMARY KEY,
-- 	category_name VARCHAR (255) NOT NULL
-- );
CREATE TABLE production.categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);
select * from production.brands;
select * from production.products;
select * from sales.customers;

-- CREATE TABLE production.brands (
-- 	brand_id INT IDENTITY (1, 1) PRIMARY KEY,
-- 	brand_name VARCHAR (255) NOT NULL
-- ); 
CREATE TABLE production.brands (
	brand_id INT AUTO_INCREMENT PRIMARY KEY,
	brand_name VARCHAR (255) NOT NULL
);



CREATE TABLE production.products (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	brand_id INT NOT NULL,
	category_id INT NOT NULL,
	model_year SMALLINT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
	FOREIGN KEY (category_id) REFERENCES production.categories (category_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (brand_id) REFERENCES production.brands (brand_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE sales.customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255) NOT NULL,
	street VARCHAR (255),
	city VARCHAR (50),
	state VARCHAR (25),
	zip_code VARCHAR (5)
);

CREATE TABLE sales.stores (
	store_id INT AUTO_INCREMENT PRIMARY KEY,
	store_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255),
	street VARCHAR (255),
	city VARCHAR (255),
	state VARCHAR (10),
	zip_code VARCHAR (5)
);

CREATE TABLE sales.staffs (
	staff_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR (255) NOT NULL UNIQUE,
	phone VARCHAR (25),
	active tinyint NOT NULL,
	store_id INT NOT NULL,
	manager_id INT,
	FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES sales.staffs (staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE sales.orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_id INT,
	order_status tinyint NOT NULL,
	-- Order status: 1 = Pending; 2 = Processing; 3 = Rejected; 4 = Completed
	order_date DATE NOT NULL,
	required_date DATE NOT NULL,
	shipped_date DATE,
	store_id INT NOT NULL,
	staff_id INT NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES sales.customers (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES sales.staffs (staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE sales.order_items (
	order_id INT,
	item_id INT,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
	discount DECIMAL (4, 2) NOT NULL DEFAULT 0,
	PRIMARY KEY (order_id, item_id),
	FOREIGN KEY (order_id) REFERENCES sales.orders (order_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES production.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE production.stocks (
	store_id INT,
	product_id INT,
	quantity INT,
	PRIMARY KEY (store_id, product_id),
	FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES production.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);













select * from production.brands;
select * from production.categories;
select * from production.products;

select production.products.product_name from production.products;

select * from production.stocks;

select * from sales.customers;
select * from sales.order_items;
select * from sales.orders;
select * from sales.staffs;
select * from sales.stores;


-- -------------------------------------------------------------------------------------------------------- --  

select
	ord.order_id,
    CONCAT(cus.first_name,' ', cus.last_name) as full_name,
    cus.city,
    cus.state,
    ord.order_date,
    SUM(ite.quantity) as 'total_units',
	SUM(ite.quantity * ite.list_price) as 'revenue',
    pro.product_name,
    bra.brand_name,
    cat.category_name,
    sto.store_name,
    CONCAT(sta.first_name,' ', sta.last_name) as 'sales_rep'
FROM 
	sales.orders ord
JOIN
	sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN
	sales.order_items ite
ON ord.order_id = ite.order_id
JOIN
	production.products pro
ON ite.product_id = pro.product_id
JOIN
	production.categories cat
ON pro.category_id = cat.category_id
JOIN
	production.brands bra
ON bra.brand_id = pro.brand_id
JOIN
	sales.stores sto
ON ord.store_id = sto.store_id
JOIN
	sales.staffs sta
ON ord.staff_id = sta.staff_id
GROUP BY
	ord.order_id,
    full_name,
    cus.city,
    cus.state,
    ord.order_date,
	pro.product_name,
    cat.category_name,
    bra.brand_name,
    sto.store_name,
    sales_rep;








