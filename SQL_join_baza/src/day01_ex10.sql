select p.name as person_name, m.pizza_name, p2.name as pizzeria_name
from person_order po 
join person p 
	on po.person_id=p.id
join menu m 
	on po.menu_id=m.id
join pizzeria p2
	on m.pizzeria_id=p2.id
where p.id in (select po.person_id
			from person_order po) and
	  m.id in (select po.menu_id
			from person_order po) and
	  p2.id in (select m.id
	  			from menu m
	  			where m.id in (select po.menu_id
							   from person_order po))
order by person_name, pizza_name, pizzeria_name