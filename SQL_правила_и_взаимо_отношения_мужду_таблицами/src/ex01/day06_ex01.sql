with pp as
(	
	select po.person_id, m.pizzeria_id
	from person_order po
	join menu m
	on po.menu_id = m.id
)
insert into person_discounts
	select row_number() over(), 
	pp.person_id, 
	pp.pizzeria_id, 
	(case 
	when count(pp.pizzeria_id) = 1 then 10.5
	when count(pp.pizzeria_id) = 2 then 22
	else 30 end)
	from pp
	group by pp.person_id, pp.pizzeria_id;