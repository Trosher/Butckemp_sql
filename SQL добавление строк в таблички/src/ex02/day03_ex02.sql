select m.pizza_name, m.price, p.name as pizzeria_name
from menu m
join pizzeria p
on m.pizzeria_id = p.id 
where m.id not in (select po.menu_id from person_order po)
order by m.pizza_name, m.price 