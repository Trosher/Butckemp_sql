SELECT
	(select "name" from person where "id" = pv.person_id) AS person_name, 
	(select "name" from pizzeria where "id" = pv.pizzeria_id) AS pizzeria_name       
FROM (SELECT * 
	FROM person_visits 
	where "visit_date" >= '2022-01-07' and "visit_date" <= '2022-01-09') AS pv
order by "person_name", "pizzeria_name" desc