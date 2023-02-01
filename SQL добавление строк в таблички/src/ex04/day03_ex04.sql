with name_female(name) as
(
	select pi.name
	from person_order po
	join menu m on po.menu_id = m.id
	join pizzeria pi on m.pizzeria_id = pi.id
	join person pe on po.person_id = pe.id
	where pe.gender = 'female'
),
name_male(name) as
(
	select pi.name
	from person_order po
	join menu m on po.menu_id = m.id
	join pizzeria pi on m.pizzeria_id = pi.id
	join person pe on po.person_id = pe.id
	where pe.gender = 'male'
),
not_male as 
(
	select *
	from name_female
	except
	select *
	from name_male
),
not_female as 
(
	select *
	from name_male
	except
	select *
	from name_female
)
select name pizzeria_name
from not_male
union
select name pizzeria_name
from not_female
order by pizzeria_name