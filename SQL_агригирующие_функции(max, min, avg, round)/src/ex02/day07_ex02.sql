(select p.name, count(p.id) as count, 'order' as action_type
from pizzeria p
join menu m 
on m.pizzeria_id = p.id 
join person_order po 
on po.menu_id = m.id
group by p.name
order by action_type, count desc
limit(3))
union all
(select p.name, count(p.id) as count, 'visit' as action_type
from person_visits pv
join pizzeria p
on p.id = pv.pizzeria_id
group by p.name
order by action_type, count desc
limit(3));