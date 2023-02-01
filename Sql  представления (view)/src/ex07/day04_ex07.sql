insert into person_visits (id, person_id, pizzeria_id, visit_date)
select max(pv.id) + 1 as id, 
	   (select p.id from person p 
	   				where p.name = 'Dmitriy') as person_id,
	   (select p.id from pizzeria p 
	   				where p.name != 'Papa Johns' 
	   				and p.id in (select m.pizzeria_id from menu m 
	   												  where m.price < 800) limit 1) as pizzeria_id, 
	   '2022-01-08' as visit_date
from person_visits pv;
refresh materialized view mv_dmitriy_visits_and_eats