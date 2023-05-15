create table employees
(
 first_name varchar(50) not NULL,
 last_name varchar(50) not NULL,
 title varchar(50) not NULL,
 birth_date date not NULL,
 notes text,
 id serial primary key
);

create table customers
(
customer_id varchar(50) primary key,
company_name text,
contact_name text
);

CREATE TABLE orders
(
order_id INT PRIMARY KEY,
customer_id VARCHAR(50) REFERENCES customers(customer_id),
employee_id INT REFERENCES employees(id),
order_date DATE NOT NULL,
ship_city VARCHAR(50) NOT NULL,
FOREIGN KEY (employee_id) REFERENCES employees(id)
);