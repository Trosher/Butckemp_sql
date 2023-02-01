select p2.name, p2.rating
from person_visits pv right join pizzeria p2
	on pv.pizzeria_id=p2.id
where pv.pizzeria_id is null