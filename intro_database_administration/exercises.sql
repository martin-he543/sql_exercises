CREATE SCHEMA toms_marketing_stuff;
USE toms_marketing_stuff;

CREATE TABLE publishers(
	publisher_id BIGINT,
    publisher_name VARCHAR(65),
	PRIMARY KEY (publisher_id)
);

CREATE TABLE publisher_spend(
	publisher_spend_id VARCHAR(45),
	publisher_id BIGINT,
    month DATE,
    spend DECIMAL,
    PRIMARY KEY(publisher_spend_id)
);

USE candystore;
ALTER TABLE employees
DROP COLUMN hourly_wage;

ALTER TABLE employees
ADD COLUMN avg_customer_rating DECIMAL;

DROP TABLE candy_products;

INSERT INTO employees VALUES
(7, 'Charles', 'Munger', '2020-03-15', 'Clerk', 5.0),
(8, 'William', 'Gates', '2020-03-15', 'Clerk', 5.0);

UPDATE employees
SET avg_customer_rating = 4.2
WHERE employee_id = 5;

SELECT * FROM employees

