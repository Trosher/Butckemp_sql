select m.pizza_name, p.name as pizzeria_name
from person_order po
join menu m
on po.menu_id = m.id
join pizzeria p
on m.pizzeria_id = p.id
join person p1
on po.person_id = p1.id
where p1.name = 'Denis' or p1.name = 'Anna'
order by m.pizza_name, pizzeria_name