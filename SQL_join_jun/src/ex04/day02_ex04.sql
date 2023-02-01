select m.pizza_name, p.name as pizzeria_name, m.price
from menu m
inner join pizzeria p
on m.pizzeria_id = p.id
where m.pizza_name = 'mushroom pizza' or m.pizza_name = 'pepperoni pizza'
order by m.pizza_name, pizzeria_name