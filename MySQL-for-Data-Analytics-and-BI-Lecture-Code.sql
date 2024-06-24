##########################################################
##########################################################
##########################################################

# SQL - MySQL for Data Analytics and Business Intelligence
# Lecture Code

##########################################################
##########################################################
##########################################################





##########################################################
##########################################################

-- SECTION: First Steps in SQL

##########################################################
##########################################################


###########
-- LECTURE: Creating a Database - Part I

CREATE DATABASE IF NOT EXISTS Sales;

CREATE SCHEMA IF NOT EXISTS Sales;


###########
-- LECTURE: Creating a Database - Part II

USE sales;


###########
-- LECTURE: Fixed and Floating-Point Data Types

CREATE TABLE test (
    test DECIMAL(5,3)
);

INSERT test VALUES (10.5);

SELECT 
    *
FROM
    test;

INSERT INTO test VALUES (12.55555);

ALTER TABLE `employees`.`test` 
ADD COLUMN `test_fl` FLOAT(5,3) NULL AFTER `test`;

INSERT INTO test(test_fl) VALUES (14.55555);

INSERT INTO test(test) VALUES (16.55555);


###########
-- LECTURE: Creating a Table

CREATE TABLE sales 
(
	purchase_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_of_purchase DATE NOT NULL,     
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
);


###########
-- LECTURE: Using Databases and Tables

/* 
CREATE DATABASE IF NOT EXISTS Sales;
USE Sales;
*/

SELECT * FROM customers;

SELECT * FROM sales.customers;


###########
-- LECTURE: Additional Notes on Using Tables

/*
CREATE TABLE sales 
(
	purchase_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_of_purchase DATE NOT NULL,     
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
);
*/

DROP TABLE sales;





##########################################################
##########################################################

-- SECTION: MySQL Constraints

##########################################################
##########################################################


###########
-- LECTURE: PRIMARY KEY Constraint

/*
CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT PRIMARY KEY,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(10)
);
*/

CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(10),
PRIMARY KEY (purchase_number)
);


###########
-- LECTURE: FOREIGN KEY Constraint - Part I

CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(10),
PRIMARY KEY (purchase_number),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);


###########
-- LECTURE: FOREIGN KEY Constraint - Part II

DROP TABLE sales;

CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(10),
PRIMARY KEY (purchase_number)
);

ALTER TABLE sales 
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

ALTER TABLE sales
DROP FOREIGN KEY sales_ibfk_1;


###########
-- LECTURE: UNIQUE KEY Constraint

/*create table customers				
(
    customer_id int,
    first_name varchar(255),
	last_name varchar(255),
	email_address varchar(255),
	number_of_complaints int,
PRIMARY KEY (customer_id)
);
*/

CREATE TABLE customers 
(
    customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id),
UNIQUE KEY (email_address)
);

DROP TABLE customers;

CREATE TABLE customers 
(
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

ALTER TABLE customers
ADD UNIQUE KEY (email_address);

ALTER TABLE customers
DROP INDEX email_address;


###########
-- LECTURE: DEFAULT KEY Constraint

CREATE TABLE customers 
(
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT DEFAULT 0,
PRIMARY KEY (customer_id)
);

DROP TABLE customers;

CREATE TABLE customers 
(
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers (first_name, last_name, gender) 
VALUES	('Peter', 'Figaro', 'M')
;

SELECT 
    *
FROM
    customers;
    
ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT;


###########
-- LECTURE: NOT NULL Constraint - Part I

CREATE TABLE companies
(
	company_id INT AUTO_INCREMENT,
    headquarters_phone_number VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
PRIMARY KEY (company_id)
);

ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL;

ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

INSERT INTO companies (headquarters_phone_number)
VALUES	('+1 (202) 555-0196')
;

INSERT INTO companies (headquarters_phone_number, company_name)
VALUES	('+1 (202) 555-0196', 'Company A')
;

SELECT * FROM companies;





##########################################################
##########################################################

-- SECTION: SQL Best Practices

##########################################################
##########################################################


###########
-- LECTURE: Coding Techniques and Best Practices - Part II

use sales;

/*
create table if not exists test (numbers int(10), words varchar(10));
*/

CREATE TABLE IF NOT EXISTS test (
    numbers 	INT(10),
    words 		VARCHAR(10)
);

SELECT 
    *
FROM
    test;

DROP TABLE test;

/*
Comment 1
Comment 2
*/
-- Comment 3
# Comment 4
### Comment 5





##########################################################
##########################################################

-- SECTION: Loading the 'employees' Database

##########################################################
##########################################################


###########
-- LECTURE: Loading the 'employees' Database

USE employees;





##########################################################
##########################################################

-- SECTION: The SQL SELECT Statement

##########################################################
##########################################################


###########
-- LECTURE: SELECT - FROM

SELECT 
    first_name, last_name
FROM
    employees;
    
SELECT 
    *
FROM
    employees;


###########
-- LECTURE: WHERE

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
    
###########
-- LECTURE: AND

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';
    

###########
-- LECTURE: OR

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' OR first_name = 'Elvis';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND first_name = 'Elvis';
    

###########
-- LECTURE: Operator Precedence

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND gender = 'M' OR gender = 'F';


SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND (gender = 'M' OR gender = 'F');


###########
-- LECTURE: IN / NOT IN

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Cathie'
        OR first_name = 'Mark'
        OR first_name = 'Nathan';

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');


SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');
    

###########
-- LECTURE: LIKE / NOT LIKE 

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE('Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE('ar%');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE('%ar');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE('%ar%');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar_');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Mar%');


###########
-- LECTURE: BETWEEN - AND
   
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';    
    
    
###########
-- LECTURE: IS NOT NULL / IS NULL
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;


###########
-- LECTURE: Other Comparison Operators

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Mark';
    
SELECT 
	*
FROM 
	employees
WHERE
	first_name <> 'Mark';
    
SELECT 
	*
FROM 
	employees
WHERE
	first_name != 'Mark';
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';

SELECT 
    *
FROM
    employees
WHERE
    hire_date < '1985-02-01';
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date <= '1985-02-01';


###########
-- LECTURE: SELECT DISTINCT

SELECT 
    gender
FROM
    employees;
    
SELECT DISTINCT
    gender
FROM
    employees;
    

###########
-- LECTURE: Introduction to Aggregate Functions    
    
SELECT 
    COUNT(emp_no)
FROM
    employees;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;
    
SELECT 
    COUNT(first_name)
FROM
    employees;

SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;


###########
-- LECTURE: ORDER BY

SELECT 
    *
FROM
    employees
ORDER BY first_name;

SELECT 
    *
FROM
    employees
ORDER BY first_name ASC;

SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;


###########
-- LECTURE: GROUP BY

SELECT 
    first_name
FROM
    employees;
    
SELECT 
    first_name
FROM
    employees
GROUP BY first_name;

SELECT DISTINCT
    first_name
FROM
    employees;

SELECT 
    COUNT(first_name)
FROM
    employees
GROUP BY first_name;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;


###########
-- LECTURE: Using Aliases (AS)

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;


###########
-- LECTURE: HAVING

SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';
    
SELECT 
    *
FROM
    employees
HAVING
    hire_date >= '2000-01-01';

/*
SELECT 
    first_name, COUNT(first_name) as names_count
FROM
    employees
WHERE
    COUNT(first_name) > 250
GROUP BY first_name
ORDER BY first_name;
*/

SELECT 
    first_name, COUNT(first_name) as names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;


###########
-- LECTURE: WHERE vs HAVING - Part I

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name;


###########
-- LECTURE: WHERE vs HAVING - Part II

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) < 200
    AND hire_date > '1999-01-01'
ORDER BY first_name DESC;


###########
-- LECTURE: LIMIT

SELECT 
    *
FROM
    salaries;
    
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC;

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name
LIMIT 100;





##########################################################
##########################################################

-- SECTION: The SQL INSERT Statement

##########################################################
##########################################################


###########
-- LECTURE: The INSERT Statement - Part I

SELECT 
    *
FROM
    employees
LIMIT 10;


INSERT INTO employees
(
	emp_no,
	birth_date,
	first_name,
	last_name,
	gender,
	hire_date
) VALUES 
(
	999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
);

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;


###########
-- LECTURE: The INSERT Statement - Part II

INSERT INTO employees
(
	birth_date,
    emp_no,
	first_name,
	last_name,
	gender,
	hire_date
) VALUES 
(
	'1973-3-26',
    999902,
    'Patricia',
    'Lawrence',
    'F',
    '2005-01-01'
);

INSERT INTO employees
VALUES
(
	999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
);

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;


###########
-- LECTURE: Inserting Data INTO a New Table

SELECT 
    *
FROM
    departments
LIMIT 10;

CREATE TABLE departments_dup 
(
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

SELECT 
    *
FROM
    departments_dup;

INSERT INTO departments_dup
(
    dept_no,
    dept_name
)
SELECT 
	*
FROM 
	departments;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;





##########################################################
##########################################################

-- SECTION: The SQL UPDATE Statement

##########################################################
##########################################################


###########
-- LECTURE: The UPDATE Statement - Part I

/*
INSERT INTO employees
(
	emp_no,
	birth_date,
	first_name,
	last_name,
	gender,
	hire_date
) VALUES 
(
	999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
);
*/

USE employees;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;

UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999909;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;


###########
-- LECTURE: The UPDATE Statement - Part II

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

COMMIT;

UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

ROLLBACK;





##########################################################
##########################################################

-- SECTION: The SQL DELETE Statement

##########################################################
##########################################################


###########
-- LECTURE: The DELETE Statement - Part I

USE employees;

COMMIT;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;

DELETE FROM employees 
WHERE
    emp_no = 999903;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;

ROLLBACK;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
    

###########
-- LECTURE: The DELETE Statement - Part II

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

DELETE FROM departments_dup;

ROLLBACK;





##########################################################
##########################################################

-- SECTION: MySQL Aggregate Functions

##########################################################
##########################################################


###########
-- LECTURE: COUNT()

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10; 

SELECT 
    COUNT(salary)
FROM
    salaries;   

SELECT 
    COUNT(from_date)
FROM
    salaries;

SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;
    
SELECT 
    COUNT(*)
FROM
    salaries;
    

###########
-- LECTURE: SUM()

SELECT 
    SUM(salary)
FROM
    salaries;
    
/*
SELECT 
    SUM(*)
FROM
    salaries;
*/    


###########
-- LECTURE: MIN() and MAX()

SELECT 
    MAX(salary)
FROM
    salaries;

SELECT 
    MIN(salary)
FROM
    salaries;
    

###########
-- LECTURE: AVG()

SELECT 
    AVG(salary)
FROM
    salaries;


###########
-- LECTURE: ROUND()
    
SELECT 
    ROUND(AVG(salary))
FROM
    salaries;

SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;
    

###########
-- LECTURE: COALESCE() - Preamble

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;
 
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no ASC; 

ALTER TABLE employees.departments_dup 
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

COMMIT;


###########
-- LECTURE: IFNULL() and COALESCE()

SELECT 
    dept_no,
    IFNULL(dept_name, 
           'Department name not provided') 
FROM
    departments_dup;

SELECT 
    dept_no,
    IFNULL(dept_name, 
           'Department name not provided') AS dept_name
FROM
    departments_dup;
    
SELECT 
    dept_no,
    COALESCE(dept_name, 
            'Department name not provided') AS dept_name
FROM
    departments_dup;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    departments_dup
ORDER BY dept_no ASC; 

ROLLBACK;


###########
-- LECTURE: Another Example of Using COALESCE()

SELECT 
    dept_no,
    dept_name,
    COALESCE('deparment manager name') AS fake_col
FROM
    departments_dup;
    
/*
SELECT 
    dept_no,
    dept_name,
    IFNULL('deparment manager name') AS fake_col
FROM
    departments_dup;
*/





##########################################################
##########################################################

-- SECTION: SQL Joins

##########################################################
##########################################################


###########
-- LECTURE: INNER JOIN - Part I

-- dept_manager_dup
SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

-- departments_dup
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;


###########
-- LECTURE: INNER JOIN - Part II

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;


###########
-- LECTURE: A Note on Using Joins

/*
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;
*/

-- add m.to_date and d.dept_name
SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- JOIN
SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- d.dept_no = m.dept_no
SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		JOIN
    departments_dup d ON d.dept_no = m.dept_no
ORDER BY m.dept_no;

-- ORDER BY d.dept_no
SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		JOIN
    departments_dup d ON d.dept_no = m.dept_no
ORDER BY d.dept_no;

-- ORDER BY dept_no
SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		JOIN
    departments_dup d ON d.dept_no = m.dept_no
ORDER BY dept_no;


###########
-- LECTURE: Duplicate Records

-- duplicate records
INSERT INTO dept_manager_dup 
VALUES 	('110228', 'd003', '1992-03-21', '9999-01-01');
        
INSERT INTO departments_dup 
VALUES	('d009', 'Customer Service');

-- dept_manager_dup
SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no ASC;

-- departments_dup
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no ASC;

-- inner join
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

-- add GROUP BY m.emp_no
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY dept_no;


###########
-- LECTURE: LEFT JOIN - Part I

-- remove the duplicates from the two tables
DELETE FROM dept_manager_dup 
WHERE emp_no = '110228';
        
DELETE FROM departments_dup 
WHERE dept_no = 'd009';

-- add back the initial records
INSERT INTO dept_manager_dup 
VALUES 	('110228', 'd003', '1992-03-21', '9999-01-01');
        
INSERT INTO departments_dup 
VALUES	('d009', 'Customer Service');

-- left join
/*
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;
*/

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;


###########
-- LECTURE: LEFT JOIN - Part II

-- d LEFT JOIN m
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
		LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- SELECT d.dept_no
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
		LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

-- LEFT OUTER JOIN
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT OUTER JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

-- m LEFT JOIN d
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- add WHERE
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
WHERE
    dept_name IS NULL
ORDER BY m.dept_no;


###########
-- LECTURE: RIGHT JOIN

/*
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;
*/

-- right join
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

-- SELECT d.dept_no
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

-- d LEFT JOIN m
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY dept_no;


###########
-- LECTURE: The New and the Old Join Syntax

-- JOIN
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
		INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- WHERE
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m,
    departments_dup d
WHERE
    m.dept_no = d.dept_no
ORDER BY m.dept_no;


###########
-- LECTURE: JOIN and WHERE Used Together

SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000
;

SELECT 
    e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000
;


###########
-- LECTURE: Using Aggregate Functions with Joins

SELECT 
    e.gender, AVG(s.salary) AS average_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender;    

-- SELECT e.emp_no
SELECT 
    e.emp_no, e.gender, AVG(s.salary) AS average_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender; 


###########
-- LECTURE: CROSS JOIN

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        INNER JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    e.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
        JOIN
	employees e ON dm.emp_no = e.emp_no
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;


###########
-- LECTURE: Join more than Two Tables in SQL

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    employees e ON m.emp_no = e.emp_no
;

-- RIGHT JOIN - JOIN
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    departments d
        RIGHT JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    employees e ON m.emp_no = e.emp_no
;

-- JOIN - RIGHT JOIN
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        RIGHT JOIN
    employees e ON m.emp_no = e.emp_no
;


###########
-- LECTURE: Tips and Tricks for Joins

SELECT 
    d.dept_name, AVG(salary)
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
;

-- add GROUP BY d.dept_name
SELECT 
    d.dept_name, AVG(salary)
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
;

-- add ORDER BY d.dept_no
SELECT 
    d.dept_name, AVG(salary)
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY d.dept_no
;


-- GROUP BY dept_name
SELECT 
    d.dept_name, AVG(salary)
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY dept_name
ORDER BY d.dept_no
;


-- AVG(salary) AS aaverage_salary 
-- add back GROUP BY d.dept_name
SELECT 
    d.dept_name, AVG(salary) AS average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY d.dept_no
;

-- ORDER BY AVG(salary) DESC
SELECT 
    d.dept_name, AVG(salary) AS average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY AVG(salary) DESC
;

-- ORDER BY average_salary DESC
SELECT 
    d.dept_name, AVG(salary) AS average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY average_salary DESC
;

-- add HAVING average_salary > 60000
SELECT 
    d.dept_name, AVG(salary) AS average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY dept_name
HAVING average_salary > 60000
ORDER BY average_salary DESC
;


###########
-- LECTURE: UNION vs UNION ALL

/*
DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup (
   emp_no int(11),
   birth_date date,
   first_name varchar(14),
   last_name varchar(16),
   gender enum('M','F'),
   hire_date date
  );
  
INSERT INTO employees_dup 
SELECT 
    e.*
FROM
    employees e
LIMIT 20;

-- Check
SELECT 
    *
FROM
    employees_dup
;

INSERT INTO employees_dup VALUES
('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');

-- Check
SELECT 
    *
FROM
    employees_dup;
*/

-- UNION ALL
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;
    
-- UNION
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;





##########################################################
##########################################################

-- SECTION: Subqueries

##########################################################
##########################################################    


###########
-- LECTURE: Subqueries with IN nested inside WHERE

SELECT 
    *
FROM
    dept_manager;
    
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
            
SELECT 
    dm.emp_no
FROM
    dept_manager dm;


###########
-- LECTURE: Subqueries with EXISTS-NOT EXISTS nested inside WHERE

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no);
       
    
    
-- add ORDER BY emp_no
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no
        ORDER BY emp_no);

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no)
ORDER BY emp_no;


###########
-- LECTURE: Subqueries nested in SELECT and FROM

-- 1) 
SELECT 
    emp_no
FROM
    dept_manager
WHERE
    emp_no = 110022;

-- 2) 
SELECT 
    e.emp_no AS employee_ID,
    MIN(de.dept_no) AS department_code,
    (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            emp_no = 110022) AS manager_ID
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
WHERE
    e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no;

-- 3) 
SELECT 
    a.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a;

-- 4)
SELECT 
    a.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a 
UNION SELECT 
    b.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b;





##########################################################
##########################################################

-- SECTION: SQL Self Join

##########################################################
########################################################## 


###########
-- LECTURE: Self Join

/*
SELECT 
   *
FROM
    emp_manager
ORDER BY emp_manager.emp_no;

SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
*/    
    
-- Select e2.*
SELECT 
    e2.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    

-- SELECT e1.emp_no, e1.dept_no, e2.manager_no
SELECT 
    e1.emp_no, e1.dept_no, e2.manager_no
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
SELECT DISTINCT
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager);
            
-- inner select 
SELECT 
    manager_no
FROM
    emp_manager
GROUP BY manager_no;





##########################################################
##########################################################

-- SECTION: SQL Views

##########################################################
########################################################## 


###########
-- LECTURE: Using SQL Views

SELECT 
    *
FROM
    dept_emp;

SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS Num
FROM
    dept_emp
GROUP BY emp_no
HAVING Num > 1;

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
        
-- The SELECT statement
SELECT 
    emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
FROM
    dept_emp
GROUP BY emp_no;





##########################################################
##########################################################

-- SECTION: Stored Routines

##########################################################
########################################################## 


###########
-- LECTURE: The MySQL Syntax for Stored Procedures

USE employees;


###########
-- LECTURE: Stored Procedures - Example - Part I

/*
USE employees;
*/
DROP procedure IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
          
			SELECT * FROM employees
			LIMIT 1000;
            
END$$

DELIMITER ;


###########
-- LECTURE: Stored Procedures - Example - Part II

/*
USE employees; 
DROP procedure IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
          
			SELECT * FROM employees
			LIMIT 1000;
            
END$$

DELIMITER ;
*/

call employees.select_employees();
call employees.select_employees;

call select_employees();
call select_employees;


###########
-- LECTURE: Another Way to Create a Procedure in MySQL

DROP PROCEDURE select_employees;


###########
-- LECTURE: Stored Procedures with an Input Parameter

USE employees;
DROP procedure IF EXISTS emp_salary;

DELIMITER $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
SELECT 
    e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END$$

DELIMITER ;


-- emp_avg_salary with SELECT e.first_name, e.last_name, avg(s.salary)
DROP procedure IF EXISTS emp_avg_salary;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary (in p_emp_no integer)
BEGIN
SELECT 
    e.first_name, e.last_name, avg(s.salary)
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END$$

DELIMITER ;

CALL emp_avg_salary(11300);


###########
-- LECTURE: Stored Procedures with an Output Parameter

DROP procedure IF EXISTS emp_avg_salary_out;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(in p_emp_no integer, out p_avg_salary decimal(10,2))
BEGIN
SELECT 
    AVG(s.salary)
INTO p_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END$$

DELIMITER ;


###########
-- LECTURE: Variables

set @v_avg_salary = 0;
call employees.emp_avg_salary_out(11300, @v_avg_salary);
select @v_avg_salary;


###########
-- LECTURE: User-Defined Functions in MySQL

USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
BEGIN

DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;

RETURN v_avg_salary;
END$$

DELIMITER ;


SELECT f_emp_avg_salary(11300);


###########
-- LECTURE: Stored Routines - Conclusion

SET @v_emp_no = 11300; 

SELECT 
    emp_no,
    first_name,
    last_name,
    f_emp_avg_salary(@v_emp_no) AS avg_salary
FROM
    employees
WHERE
    emp_no = @v_emp_no;



##########################################################
##########################################################

-- SECTION: Advanced SQL Tools

##########################################################
########################################################## 


###########
-- LECTURE: Types of MySQL Variables - Local Variables

-- v_avg_salary
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no integer) RETURNS decimal(10,2)
BEGIN

DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;

RETURN v_avg_salary;
END$$

DELIMITER ;

SELECT v_avg_salary;

-- v_avg_salary_2 (ERROR)
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no integer) RETURNS decimal(10,2)
BEGIN

DECLARE v_avg_salary decimal(10,2);

BEGIN
	DECLARE v_avg_salary_2 decimal(10,2);
END;


SELECT 
    AVG(s.salary)
INTO v_avg_salary_2 FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;

RETURN v_avg_salary_2;
END$$

DELIMITER ;


###########
-- LECTURE: Session Variables

set @s_var1 = 3;
select @s_var1;


###########
-- LECTURE: Global Variables

SET GLOBAL max_connections = 1000;
/*
SET @@global.max_connections = 1000;
*/

SET @@global.max_connections = 1;
/*
SET GLOBAL max_connections = 1;
*/


###########
-- LECTURE: User-Defined vs System Variables

-- ERROR
SET SESSION max_connections = 1000;

SET SESSION sql_mode='STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
SET GLOBAL sql_mode='STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

SET @@session.sql_mode='STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

###########
-- LECTURE: MySQL Triggers
USE employees;
COMMIT;

-- BEFORE INSERT
DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = 0; 
	END IF; 
END $$

DELIMITER ;


SELECT 
    *
FROM
    salaries;

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
    
INSERT INTO salaries VALUES('10001', -92891, '2010-06-22', '9999-01-01');

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
    
    
-- BEFORE UPDATE
DELIMITER $$

CREATE TRIGGER trig_upd_salary
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = OLD.salary; 
	END IF; 
END $$

DELIMITER ;


UPDATE salaries 
SET 
    salary = 98765
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
UPDATE salaries 
SET 
    salary = - 50000
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
SELECT SYSDATE();

SELECT DATE_FORMAT(SYSDATE(), '%Y-%m-%d') as today;

-- AFTER INSERT
DELIMITER $$

CREATE TRIGGER trig_ins_dept_mng
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE v_curr_salary int;
    
    SELECT 
		MAX(salary)
	INTO v_curr_salary FROM
		salaries
	WHERE
		emp_no = NEW.emp_no;

	IF v_curr_salary IS NOT NULL THEN
		UPDATE salaries 
		SET 
			to_date = SYSDATE()
		WHERE
			emp_no = NEW.emp_no and to_date = NEW.to_date;

		INSERT INTO salaries 
			VALUES (NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date);
    END IF;
END $$

DELIMITER ;

INSERT INTO dept_manager VALUES ('111534', 'd009', date_format(sysdate(), '%Y-%m-%d'), '9999-01-01');

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no = 111534;
    
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = 111534;
    

ROLLBACK;


###########
-- LECTURE: MySQL Indexes
 
SELECT 
    *
FROM
    employees

WHERE
    hire_date > '2000-01-01';

CREATE INDEX i_hire_date ON employees(hire_date);

SELECT 
    *
FROM
    employees

WHERE
    hire_date > '2000-01-01';
    
-- Composite Indexes
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Georgi'
        AND last_name = 'Facello';
        
CREATE INDEX i_composite ON employees(first_name, last_name);
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Georgi'
        AND last_name = 'Facello';

-- SHOW INDEX
SHOW INDEX FROM employees FROM employees;
SHOW INDEX FROM employees;


###########
-- LECTURE: The CASE Statement

SELECT 
    emp_no,
    first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees;

    
SELECT 
	emp_no,
	first_name,
	last_name,
	CASE gender
		WHEN 'M' THEN 'Male'
		ELSE 'Female'
	END AS gender
FROM
	employees;
    

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE dm.emp_no
        WHEN  dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;


SELECT 
    emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') AS gender
FROM
    employees;
    

SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than $30,000'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 
									'Salary was raised by more than $20,000 but less than $30,000'
        ELSE 'Salary was raised by less than $20,000'
    END AS salary_increase
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;



##########################################################
##########################################################

-- SECTION: SQL Window Functions

##########################################################
##########################################################


###########
-- LECTURE: The ROW_NUMBER() Ranking Window Function and the Relevant MySQL Syntax

USE employees;

SELECT
	emp_no,
	salary
FROM 
	salaries;

SELECT 
	emp_no, 
    salary, 
    ROW_NUMBER() OVER () AS row_num
FROM 
	salaries;

SELECT 
	emp_no, 
    salary, 
    ROW_NUMBER() OVER (PARTITION BY emp_no) AS row_num
FROM
	salaries;
    
SELECT 
	emp_no, 
    salary, 
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM
	salaries;
    
SELECT 
	emp_no, 
    salary, 
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM
	salaries;



###########
-- LECTURE: A Note on Using Several Window Functions in a Query

USE employees;

SELECT 
	emp_no, 
    salary, 
    ROW_NUMBER() OVER () AS row_num1,
    ROW_NUMBER() OVER (PARTITION BY emp_no) AS row_num2,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num3,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num4
FROM
	salaries;
    
SELECT 
	emp_no, 
    salary, 
    ROW_NUMBER() OVER () AS row_num1,
    ROW_NUMBER() OVER (PARTITION BY emp_no) AS row_num2,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num3,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num4
FROM
	salaries
ORDER BY emp_no, salary;

SELECT 
	emp_no, 
    salary, 
    #ROW_NUMBER() OVER () AS row_num1,
    ROW_NUMBER() OVER (PARTITION BY emp_no) AS row_num2,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num3
    #ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num4
FROM
	salaries;



###########
-- LECTURE: MySQL Window Functions Syntax

USE employees;    
    
SELECT 
	emp_no, 
    salary, 
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM
	salaries;
    
SELECT 
	emp_no, 
	salary, 
	ROW_NUMBER() OVER w AS row_num
FROM
	salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);



###########
-- LECTURE: The PARTITION BY Clause VS the GROUP BY Clause

USE employees;

SELECT 
    *
FROM
    salaries
GROUP BY emp_no;

SELECT 
	emp_no, 
    salary, 
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM
	salaries;



SELECT a.emp_no, 
       MAX(salary) AS max_salary FROM (
	SELECT 
		emp_no, salary, ROW_NUMBER() OVER w AS row_num
	FROM
		salaries
	WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)) a
GROUP BY emp_no;


SELECT a.emp_no, MAX(salary) AS max_salary FROM (
	SELECT 
		emp_no, salary, ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) as row_num
	FROM
		salaries) a
GROUP BY emp_no;


SELECT a.emp_no, 
       MAX(salary) AS max_salary FROM (
	SELECT 
		emp_no, salary
	FROM
		salaries) a
GROUP BY emp_no;


SELECT a.emp_no, 
       a.salary AS max_salary FROM (
	SELECT 
		emp_no, salary, ROW_NUMBER() OVER w as row_num
	FROM
		salaries
	WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)) a
WHERE a.row_num = 1;


SELECT a.emp_no, 
       a.salary AS max_salary FROM (
	SELECT 
		emp_no, salary, ROW_NUMBER()   OVER w as row_num
	FROM
		salaries
	WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)) a
WHERE a.row_num = 2;


SELECT 
	emp_no, 
    salary, 
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM
	salaries;
    


###########
-- LECTURE: The MySQL RANK() and DENSE_RANK() Window Functions

USE employees;

SELECT 
	emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM
	salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);
    

SELECT 
	emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM
	salaries
WHERE emp_no = 10001
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);


SELECT DISTINCT
	emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM
	salaries
WHERE emp_no = 10001
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

SELECT
    emp_no, (COUNT(salary) - COUNT(DISTINCT salary)) as diff
FROM
    salaries
GROUP BY emp_no
HAVING diff > 0
ORDER BY emp_no;

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = 11839;

SELECT
	emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM
	salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

SELECT 
	emp_no, salary, RANK() OVER w AS rank_num
FROM
	salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

SELECT 
	emp_no, salary, DENSE_RANK() OVER w AS rank_num
FROM
	salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);




###########
-- LECTURE: Working with MySQL Ranking Window Functions and Joins Together

USE employees;

SELECT 
	d.dept_no,
    d.dept_name,
    dm.emp_no,
    RANK() OVER w AS department_salary_ranking,
    s.salary,
    s.from_date AS salary_from_date,
    s.to_date AS salary_to_date,	
    dm.from_date AS dept_manager_from_date,
    dm.to_date AS dept_manager_to_date
FROM
    dept_manager dm
        JOIN
    salaries s ON s.emp_no = dm.emp_no
        JOIN
    departments d ON d.dept_no = dm.dept_no
WINDOW w AS (PARTITION BY dm.dept_no ORDER BY s.salary DESC);


SELECT 
	d.dept_no,
    d.dept_name,
    dm.emp_no,
    RANK() OVER w AS department_salary_ranking,
    s.salary,
    s.from_date AS salary_from_date,
    s.to_date AS salary_to_date,	
    dm.from_date AS dept_manager_from_date,
    dm.to_date AS dept_manager_to_date
FROM
    dept_manager dm
        JOIN
    salaries s ON s.emp_no = dm.emp_no
        AND s.from_date BETWEEN dm.from_date AND dm.to_date
        AND s.to_date BETWEEN dm.from_date AND dm.to_date
        JOIN
    departments d ON d.dept_no = dm.dept_no
WINDOW w AS (PARTITION BY dm.dept_no ORDER BY s.salary DESC);



###########
-- LECTURE: The LAG() and LEAD() Value Window Functions

USE employees;

SELECT 
    *
FROM
    salaries
LIMIT 10;

SELECT 
	emp_no,
    salary, 
    LAG(salary) OVER w AS previous_salary,
    LEAD(salary) OVER w AS next_salary,
    salary - LAG(salary) OVER w AS diff_salary_current_previous,
	LEAD(salary) OVER w - salary AS diff_salary_next_current    
FROM
	salaries
WHERE emp_no = 10001
WINDOW w AS (ORDER BY salary);


###########
-- LECTURE: MySQL Aggregate Functions in the Context of Window Functions - Part I

USE employees;

SELECT SYSDATE();

SELECT 
    emp_no, salary, from_date, to_date
FROM
    salaries
WHERE
    to_date > SYSDATE();

# Error code: 1055
SELECT 
    emp_no, salary, MAX(from_date), to_date
FROM
    salaries
WHERE
    to_date > SYSDATE()
GROUP BY emp_no;    


SELECT 
    s1.emp_no, s.salary, s.from_date, s.to_date
FROM
    salaries s
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        salaries	
    GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
WHERE
    s.to_date > SYSDATE()
        AND s.from_date = s1.from_date;
        


###########
-- LECTURE: MySQL Aggregate Functions in the Context of Window Functions - Part II

USE employees;

SELECT * FROM dept_emp LIMIT 1000;
SELECT * FROM dept_emp WHERE emp_no = 10010 ORDER BY from_date;
SELECT * FROM dept_emp WHERE emp_no = 10018 ORDER BY from_date;

SELECT * FROM salaries WHERE emp_no = 10010 ORDER BY from_date;


SELECT 
    de.emp_no, de.dept_no, de.from_date, de.to_date
FROM
    dept_emp de
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        dept_emp
    GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no
WHERE
    de.to_date > SYSDATE()
        AND de.from_date = de1.from_date;


SELECT 
    de2.emp_no, d.dept_name, s2.salary, AVG(s2.salary) OVER w AS average_salary_per_department
FROM
    (SELECT 
    de.emp_no, de.dept_no, de.from_date, de.to_date
FROM
    dept_emp de
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        dept_emp
    GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no
WHERE
    de.to_date > SYSDATE()
        AND de.from_date = de1.from_date) de2
        JOIN
    (SELECT 
    s1.emp_no, s.salary, s.from_date, s.to_date
FROM
    salaries s
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        salaries	
    GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
WHERE
    s.to_date > SYSDATE()
        AND s.from_date = s1.from_date) s2 ON s2.emp_no = de2.emp_no
			JOIN
    departments d ON d.dept_no = de2.dept_no
GROUP BY de2.emp_no, d.dept_name
WINDOW w AS (PARTITION BY de2.dept_no)
ORDER BY de2.emp_no;




###########
-- LECTURE: MySQL Common Table Expressions - Introduction
USE employees;

SELECT 
    AVG(salary) AS avg_salary
FROM
    salaries;
    
    
WITH cte AS (
SELECT AVG(salary) AS avg_salary FROM salaries)
SELECT 
SUM(CASE WHEN s.salary > c.avg_salary THEN 1 ELSE 0 END) AS no_f_salaries_above_avg,
COUNT(s.salary) AS total_no_of_salary_contracts
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no AND e.gender = 'F'
        CROSS JOIN
    cte c;


WITH cte AS (
SELECT AVG(salary) AS avg_salary FROM salaries)
SELECT 
    *
FROM
    cte;
    
WITH cte AS (
SELECT AVG(salary) AS avg_salary FROM salaries)
SELECT 
    *
FROM
	salaries s
		JOIN 
    cte c;
    
WITH cte AS (
SELECT AVG(salary) AS avg_salary FROM salaries)
SELECT 
    *
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no AND e.gender = 'F'
        JOIN
    cte c;
    
WITH cte AS (
SELECT AVG(salary) AS avg_salary FROM salaries)
SELECT 
    *
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no AND e.gender = 'F'
        CROSS JOIN
    cte c;
  
SELECT 
    SUM(CASE
        WHEN s.salary > a.avg_salary THEN 1
        ELSE 0
    END) AS no_f_salaries_above_avg,
    COUNT(s.salary) AS total_no_of_salary_contracts
FROM
    salaries s
        JOIN
    employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
		CROSS JOIN
	(SELECT 
        AVG(salary) AS avg_salary
    FROM
        salaries s) a;


###########
-- LECTURE: An Alternative Solution to the Same Task-Exercise
USE employees;

WITH cte AS (
SELECT AVG(salary) AS avg_salary FROM salaries)
SELECT 
SUM(CASE WHEN s.salary > c.avg_salary THEN 1 ELSE 0 END) AS no_f_salaries_above_avg_w_sum,
COUNT(CASE WHEN s.salary > c.avg_salary THEN s.salary ELSE NULL END) AS no_f_salaries_above_avg_w_count,
COUNT(s.salary) AS total_no_of_salary_contracts
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no AND e.gender = 'F'
        CROSS JOIN
    cte c;


###########
-- LECTURE: Using Multiple Subclauses in a WITH Clause
-- Part I

USE employees;

SELECT 
    AVG(salary) AS avg_salary
FROM
    salaries;
    
SELECT 
    s.emp_no, MAX(s.salary) AS highest_salary
FROM
    salaries s
        JOIN
    employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no;

/*
SELECT 
    s.emp_no, MAX(s.salary) AS highest_salary
FROM
    salaries s
        JOIN
    employees e ON e.emp_no = s.emp_no
WHERE e.gender = 'F'
GROUP BY s.emp_no;
*/

WITH cte1 AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
SELECT s.emp_no, MAX(s.salary) AS f_highest_salary
FROM salaries s 
JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
)
SELECT 
SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) AS f_highest_salaries_above_avg,
COUNT(e.emp_no) AS total_no_female_contracts
FROM employees e
JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;

-- Part II

USE employees;

WITH cte1 AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
SELECT s.emp_no, MAX(s.salary) AS f_highest_salary
FROM salaries s 
JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
)
SELECT 
SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) AS f_highest_salaries_above_avg,
COUNT(e.emp_no) AS total_no_female_contracts
FROM employees e
JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;


WITH cte1 AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
SELECT s.emp_no, MAX(s.salary) AS f_highest_salary
FROM salaries s 
JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
)
SELECT 
COUNT(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN c2.f_highest_salary ELSE NULL END) AS f_highest_salaries_above_avg,
COUNT(e.emp_no) AS total_no_female_contracts
FROM employees e
JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;


WITH cte1 AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
SELECT s.emp_no, MAX(s.salary) AS f_highest_salary
FROM salaries s 
JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
)
SELECT 
SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) AS f_highest_salaries_above_avg,
COUNT(e.emp_no) AS total_no_female_contracts,
(SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) / COUNT(e.emp_no))*100
FROM employees e
JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;


WITH cte1 AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
SELECT s.emp_no, MAX(s.salary) AS f_highest_salary
FROM salaries s 
JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
)
SELECT 
SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) AS f_highest_salaries_above_avg,
COUNT(e.emp_no) AS total_no_female_contracts,
ROUND((SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END)/COUNT(e.emp_no))*100, 2) 
FROM employees e
JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;


WITH cte1 AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
SELECT s.emp_no, MAX(s.salary) AS f_highest_salary
FROM salaries s 
JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
)
SELECT 
SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) AS f_highest_salaries_above_avg,
COUNT(e.emp_no) AS total_no_female_contracts,
CONCAT(ROUND((SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END)/COUNT(e.emp_no))*100, 2), '%') 
FROM employees e
JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;


WITH cte1 AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
SELECT s.emp_no, MAX(s.salary) AS f_highest_salary
FROM salaries s 
JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
)
SELECT 
SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) AS f_highest_salaries_above_avg,
COUNT(e.emp_no) AS total_no_female_contracts,
CONCAT(ROUND((SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END)/COUNT(e.emp_no))*100, 2), '%') AS '% percentage'
FROM employees e
JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;


WITH cte1 AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
SELECT s.emp_no, MAX(s.salary) AS f_highest_salary
FROM salaries s 
JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
)
SELECT 
SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) AS f_highest_salaries_above_avg,
COUNT(c2.emp_no) AS total_no_female_contracts,
CONCAT(ROUND((SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END)/COUNT(c2.emp_no))*100, 2), '%') AS '% percentage'
FROM #employees e
#JOIN 
cte2 c2 #ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;


WITH cte_avg_salary AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte_f_highest_salary AS (
SELECT s.emp_no, MAX(s.salary) AS f_highest_salary
FROM salaries s 
JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
)
SELECT 
SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) AS f_highest_salaries_above_avg,
COUNT(e.emp_no) AS total_no_female_contracts,
CONCAT(ROUND((SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END)/COUNT(e.emp_no))*100, 2), '%') AS '% percentage'
FROM employees e
JOIN cte_f_highest_salary c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte_avg_salary c1;


###########
-- LECTURE: Referring to Common Table Expressions in a WITH Clause
USE employees;

SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    

WITH emp_hired_from_jan_2000 AS (
SELECT * FROM employees WHERE hire_date > '2000-01-01'
),
highest_contract_salary_values AS (
SELECT e.emp_no, MAX(s.salary) FROM salaries s JOIN emp_hired_from_jan_2000 e ON e.emp_no = s.emp_no GROUP BY e.emp_no 
)
SELECT * FROM highest_contract_salary_values;


SELECT 
    *
FROM
    salaries
WHERE
    emp_no IN (205048, 
		222965,
        226633,
        227544,
        422990,
        424445,
        428377,
        463807,
        499553);
    
    
WITH highest_contract_salary_values AS (
SELECT e.emp_no, MAX(s.salary) FROM emp_hired_from_jan_2000 e JOIN salaries s ON e.emp_no = s.emp_no GROUP BY e.emp_no 
),
emp_hired_from_jan_2000 AS (
SELECT * FROM employees WHERE hire_date > '2000-01-01'
)
SELECT * FROM highest_contract_salary_values;



##########################################################
##########################################################

-- SECTION: SQL Temporary Tables

##########################################################
##########################################################


###########
-- LECTURE: MySQL Temporary Tables in Action
USE employees;

SELECT 
    s.emp_no, MAX(s.salary) AS f_highest_salary
FROM
    salaries s
        JOIN
    employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no;


CREATE TEMPORARY TABLE f_highest_salaries
SELECT 
    s.emp_no, MAX(s.salary) AS f_highest_salary
FROM
    salaries s
        JOIN
    employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no;

SELECT 
    *
FROM
    f_highest_salaries;

SELECT 
    *
FROM
    f_highest_salaries
WHERE emp_no <= '10010';

DROP TABLE IF EXISTS f_highest_salaries;


SELECT 
    *
FROM
    f_highest_salaries;
    
SELECT 
    *
FROM
    departments;

    
    
###########
-- LECTURE: Other Features of MySQL Temporary Tables
USE employees;

DROP TEMPORARY TABLE IF EXISTS f_highest_salaries;

CREATE TEMPORARY TABLE f_highest_salaries
SELECT 
    s.emp_no, MAX(s.salary) AS f_highest_salary
FROM
    salaries s
        JOIN
    employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
LIMIT 10;

SELECT 
    *
FROM
    f_highest_salaries;

SELECT 
    *
FROM
    f_highest_salaries f1
        JOIN
    f_highest_salaries f2;
    
SELECT 
    *
FROM
    f_highest_salaries f1 
UNION SELECT 
    *
FROM
    f_highest_salaries f2;


WITH cte AS (SELECT 
    s.emp_no, MAX(s.salary) AS f_highest_salary
FROM
    salaries s
        JOIN
    employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
LIMIT 10)
SELECT * FROM f_highest_salaries f1 JOIN cte c;


WITH cte AS (SELECT 
    s.emp_no, MAX(s.salary) AS f_highest_salary
FROM
    salaries s
        JOIN
    employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
LIMIT 10)
SELECT * FROM f_highest_salaries UNION ALL SELECT * FROM cte;

    
CREATE TEMPORARY TABLE dates
SELECT 
    NOW() AS current_date_and_time,
    DATE_SUB(NOW(), INTERVAL 1 MONTH) AS a_month_earlier,
    DATE_SUB(NOW(), INTERVAL -1 YEAR) AS a_year_later;
    
SELECT 
    *
FROM
    dates;

SELECT 
    *
FROM
    dates d1
        JOIN
    dates d2;
    
SELECT 
    *
FROM
    dates d1 
UNION SELECT 
    *
FROM
    dates d2;

WITH cte AS (SELECT 
    NOW() AS current_date_and_time,
    DATE_SUB(NOW(), INTERVAL 1 MONTH) AS a_month_earlier,
    DATE_SUB(NOW(), INTERVAL -1 YEAR) AS a_year_later)
SELECT * FROM dates d1 JOIN cte c;

WITH cte AS (SELECT 
    NOW() AS current_date_and_time,
    DATE_SUB(NOW(), INTERVAL 1 MONTH) AS a_month_earlier,
    DATE_SUB(NOW(), INTERVAL -1 YEAR) AS a_year_later)
SELECT * FROM dates UNION ALL SELECT * FROM cte;

    
DROP TABLE IF EXISTS f_highest_salaries;
DROP TEMPORARY TABLE IF EXISTS dates;



-- End.
##########################################################