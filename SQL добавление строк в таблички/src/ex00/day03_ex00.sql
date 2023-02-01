select m.pizza_name, m.price, p.name as pizzeria_name, pv.visit_date
from person p1
left join person_visits pv on p1.id = pv.person_id 
left join pizzeria p on pv.pizzeria_id  = p.id
left join menu m on p.id  = m.pizzeria_id
where (m.price  >= 800 and m.price <= 1000) and 
	   p1.name = 'Kate'
order by m.pizza_name, m.price desc, pizzeria_name