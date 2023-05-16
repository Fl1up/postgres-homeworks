-- Напишите запросы, которые выводят следующую информацию:
-- 1. заказы, отправленные в города, заканчивающиеся на 'burg'. Вывести без повторений две колонки (город, страна) (см. таблица orders, колонки ship_city, ship_country)
select distinct ship_city,ship_country from orders
where ship_city like '%burg'
order by ship_city

-- 2. из таблицы orders идентификатор заказа, идентификатор заказчика, вес и страну отгрузки. Заказ отгружен в страны, начинающиеся на 'P'. Результат отсортирован по весу (по убыванию). Вывести первые 10 записей.
SELECT order_id, customer_id, freight, ship_country
FROM orders
WHERE ship_country LIKE 'P%'
ORDER BY freight DESC
LIMIT 10;

-- 3. фамилию и телефон сотрудников, у которых в данных отсутствует регион (см таблицу employees)
select first_name ,last_name,home_phone  from employees
where region is NULL

-- 4. количество поставщиков (x) в каждой из стран. Результат отсортировать по убыванию количества поставщиков в стране
select distinct country,count(country) from suppliers
group by country
order by COUNT(country) DESC

-- 5. суммарный вес заказов (в которых известен регион) по странам, но вывести только те результаты, где суммарный вес на страну больше 2750. Отсортировать по убыванию суммарного веса (см таблицу orders, колонки ship_region, ship_country, freight)
SELECT ship_country, SUM(freight)
FROM orders
WHERE ship_region IS NOT NULL
GROUP BY ship_country
HAVING SUM(freight) > 2750
ORDER BY ship_country DESC;
---

-- 6. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers) и работники (employees).
select country from customers
intersect
select country from suppliers
intersect
select country from employees

-- 7. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers), но не зарегистрированы работники (employees).
select country from customers
intersect
select country from suppliers
except
select country from employees