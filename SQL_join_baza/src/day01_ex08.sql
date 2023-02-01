select aga.order_date, concat(person.name, '(age:', person.age, ')') as person_information
from (select person_order.person_id as id, person_order.order_date 
	from person_order) as aga
natural join person
order by aga.order_date, person_information