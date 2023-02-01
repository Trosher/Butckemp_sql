select case 
	when p.name is null then '-'
	else p.name
end as person_name, pv.visit_date, case
	when p2.name is null then '-'
	else p2.name
end as pizzeria_name
from (select * from person_visits pv
	  where pv.visit_date >= '2022-01-01'
	  and pv.visit_date <= '2022-01-03') as pv
full join person p	   
	 on pv.person_id=p.id
full join pizzeria p2
	 on pv.pizzeria_id=p2.id
order by person_name, pv.visit_date, pizzeria_name