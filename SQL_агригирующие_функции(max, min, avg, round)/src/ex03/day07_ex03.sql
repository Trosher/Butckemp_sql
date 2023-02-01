with t1 as
(
	select p.name, count(p.id) as count
	from pizzeria p
	join menu m 
	on m.pizzeria_id = p.id 
	join person_order po 
	on po.menu_id = m.id
	group by p.name
), t2 as
(
	select p.name, count(p.id) as count
	from person_visits pv
	join pizzeria p
	on p.id = pv.pizzeria_id
	group by p.name
)
select t1.name, t1.count + t2.count as total_count
from t1
join t2
on t1.name = t2.name
order by total_count desc, t1.name;