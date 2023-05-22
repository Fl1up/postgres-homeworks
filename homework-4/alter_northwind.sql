-- Подключиться к БД Northwind и сделать следующие изменения:
-- 1. Добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)
alter table products add constraint check_unit_price check (unit_price > 0);

-- 2. Добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1
alter table products add constraint check_discontinued chech (discontinued = 0 or discontinued = 1)

-- 3. Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)
select * into top_discontinued from products where discontinued = 1

-- 4. Удалить из products товары, снятые с продажи (discontinued = 1)
-- Для 4-го пункта может потребоваться удаление ограничения, связанного с foreign_key. Подумайте, как это можно решить, чтобы связь с таблицей order_details все же осталась.
alter table order_details drop foreign key fk_order_details_product_id
delete from product where discountinued = 1
alter table order_details add constraint fk_order_details_product_id foreign key  (product_id) references products (product_id)
