with min_max_std_price as
(
	select p.name, round(avg(m.price), 2) as average_price, 
		           max(m.price) as max_price, 
		           min(m.price) as min_price from person_order po
	join menu m on po.menu_id = m.id
	join pizzeria p on m.pizzeria_id = p.id
	group by p.name
), count_of_orders as
(
	select p.name, count(m.pizzeria_id) as count_of_orders from person_order po
	join menu m on po.menu_id = m.id
	join pizzeria p on m.pizzeria_id = p.id
	group by p.name
)
select min_max_std_price.name, count_of_orders, average_price, max_price, min_price
from min_max_std_price
join count_of_orders
on count_of_orders.name = min_max_std_price.name
order by name;