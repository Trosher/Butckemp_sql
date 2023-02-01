select t1.name as person_name1, t2.name as person_name2, t1.address as common_address
from person as t1
join person as t2
on t1.id > t2.id
where t1.address = t2.address 
order by person_name1, person_name2, common_address