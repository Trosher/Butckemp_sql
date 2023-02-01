select p."name" as name_pizzeria
from person_visits pv
join person p1
on pv.person_id  = p1.id
join pizzeria p
on pv.pizzeria_id = p.id
join menu m
on p.id = m.pizzeria_id
where p1.name = 'Dmitriy' and pv.visit_date = '2022-01-08' and m.price < 800