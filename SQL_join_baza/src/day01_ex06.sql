select person_order.order_date as action_date, person.name as person_name
from person_order
join person on person.id=person_order.person_id 
intersect
select person_visits.visit_date as action_date, person.name as person_name
from person_visits
join person on person.id=person_visits.person_id
order by action_date, person_name desc