select distinct p.name pizzeria_name
from person p1
join person_order po 
on p1.id = po.person_id 
join person_visits pv 
on p1.id = pv.person_id 
join pizzeria p 
on pv.pizzeria_id = p.id
where p1."name"  = 'Andrey' and pv.visit_date != po.order_date