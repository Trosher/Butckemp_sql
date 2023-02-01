with name_female(name) as
(
	select pi.name
	from person_visits pv
	join pizzeria pi
	on pv.pizzeria_id = pi.id
	join person pe
	on pv.person_id = pe.id
	where pe.gender = 'female'
),
name_male(name) as
(
	select pi.name
	from person_visits pv
	join pizzeria pi
	on pv.pizzeria_id = pi.id
	join person pe
	on pv.person_id = pe.id
	where pe.gender = 'male'
),
not_male as 
(
	select *
	from name_female
	except all
	select *
	from name_male
),
not_female as 
(
	select *
	from name_male
	except all
	select *
	from name_female
)
select name pizzeria_name
from not_male
union all
select name pizzeria_name
from not_female
order by pizzeria_name