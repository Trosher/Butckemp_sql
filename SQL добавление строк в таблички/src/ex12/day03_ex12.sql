insert into person_order (id, person_id, menu_id, order_date)
select aga as id, 
	   id as person_id, 
	   (select id from menu where pizza_name = 'greek pizza') as menu_id, 
	   '2022-02-25' as order_date
from generate_series((select max(id) + 1 from person_order), 
					(select max(id) from person_order) + 
					(select max(id) from person)) aga
join person p 
on p.id + (select max(id) from person_order) = aga