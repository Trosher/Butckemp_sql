select pizzeria.name as "The_result_of_the_first_sql_statement", 
	aga.second_sql_statement
from pizzeria
cross join (select pizzeria.name as "second_sql_statement"
			from pizzeria
			where not exists (select pizzeria_id 
								from person_visits
								where pizzeria.id=person_visits.pizzeria_id)) as aga
where pizzeria.id not in (select pizzeria_id from person_visits)

-- select pizzeria.name
-- from pizzeria
-- where not exists (select pizzeria_id 
--			from person_visits
--			where pizzeria.id=person_visits.pizzeria_id))