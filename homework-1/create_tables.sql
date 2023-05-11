create table employees
(
 first_name varchar(50) not NULL,
 last_name varchar(50) not NULL,
 title varchar(50) not NULL,
 birth_date date,
 notes text
);

create table customers
(
customer_id varchar(50) ,
company_name text,
contact_name text
);

create table orders
(
order_id int primary key,
customer_id varchar(50) REFERENCES orders(customer_id),
employee_id int,
order_date date,
ship_city varchar(50) not NULL
);