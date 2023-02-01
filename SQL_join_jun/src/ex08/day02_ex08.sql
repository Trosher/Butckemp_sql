select p1.name
from person_order po
join menu m
on m.id = po.menu_id 
join person p1
on po.person_id = p1.id
where (p1.address = 'Moscow' or p1.address = 'Samara') and p1.gender = 'male'
	  and (m.pizza_name = 'pepperoni pizza' or m.pizza_name = 'mushroom pizza') 
order by p1.name desc