select distinct p1.name
from person_order po
join menu m
on m.id = po.menu_id
join person p1
on po.person_id = p1.id
where p1.gender = 'female' and (p1.id in (select po.person_id from person_order po join
														  menu m on po.menu_id = m.id where
														  m.pizza_name = 'pepperoni pizza') 
						   and p1.id in (select po.person_id from person_order po join
														  menu m on po.menu_id = m.id where
														  m.pizza_name = 'cheese pizza'))
order by p1.name