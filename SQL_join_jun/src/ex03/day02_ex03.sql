with missing_date(missing_date) as 
(
	select cast(missing_date as date)
	from generate_series('2022-01-01'::timestamp,
                     '2022-01-10', '1 day') AS missing_date
),
pv (visit_date) as
(
	select pv.visit_date
	from person_visits pv
	where pv.person_id = 1 or pv.person_id = 2
)
select missing_date
from missing_date
left join pv
on missing_date=pv.visit_date
where pv.visit_date is null
order by missing_date