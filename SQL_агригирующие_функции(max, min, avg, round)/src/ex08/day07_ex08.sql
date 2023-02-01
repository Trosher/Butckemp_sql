select p2.address, p.name, 
	   count(m.pizzeria_id) as count_of_orders 
from person_order po
join menu m on po.menu_id = m.id
join pizzeria p on m.pizzeria_id = p.id
join person p2 on po.person_id = p2.id
group by p2.address, p.name
order by p2.address, p.name;