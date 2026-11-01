CREATE DATABASE IF NOT EXISTS tasnia_bakery_portfolio CHARACTER SET utf8mb4;
USE tasnia_bakery_portfolio;

CREATE TABLE customers (
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(100) NOT NULL,
 age_in_2021 INT NOT NULL CHECK (age_in_2021 BETWEEN 18 AND 65),
 gender VARCHAR(10) NOT NULL,
 religion VARCHAR(10) NOT NULL,
 area VARCHAR(80) NOT NULL,
 upazila VARCHAR(40) NOT NULL,
 district VARCHAR(30) NOT NULL
);
CREATE TABLE products (
 product_id INT PRIMARY KEY,
 product_name VARCHAR(80) NOT NULL,
 category VARCHAR(20) NOT NULL,
 sale_unit VARCHAR(30) NOT NULL,
 unit_price_bdt DECIMAL(10,2) NOT NULL CHECK (unit_price_bdt > 0),
 unit_cost_bdt DECIMAL(10,2) NOT NULL CHECK (unit_cost_bdt >= 0)
);
CREATE TABLE orders (
 order_id INT PRIMARY KEY,
 order_date DATE NOT NULL CHECK (order_date BETWEEN '2020-12-01' AND '2021-08-31'),
 customer_id INT NOT NULL,
 product_id INT NOT NULL,
 quantity INT NOT NULL CHECK (quantity > 0),
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
 FOREIGN KEY (product_id) REFERENCES products(product_id)
);
