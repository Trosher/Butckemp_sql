select distinct m1.pizza_name, p1.name pizzeria_name_1, p2.name pizzeria_name_2, m1.price
from menu as m1
join menu as m2
on m1.price = m2.price
join pizzeria p1
on m1.pizzeria_id = p1.id
join pizzeria p2
on m2.pizzeria_id = p2.id
where m1.pizzeria_id > m2.pizzeria_id and m1.price = m2.price and m1.pizza_name = m2.pizza_name 
order by m1.pizza_name