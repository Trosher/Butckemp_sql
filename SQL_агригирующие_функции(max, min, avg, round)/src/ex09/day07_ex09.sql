with t as
(
	select p.address, round(max(p.age)::numeric - (min(p.age)::numeric / max(age)::numeric), 2) as formula, 
					  round(avg(p.age), 2) as average
	from person p
	group by p.address
)
select t.address, t.formula, t.average,
				  case 
				  	when t.formula > t.average then 'true'
				  	else 'false'
				  end as comparison
from t
order by t.address
 