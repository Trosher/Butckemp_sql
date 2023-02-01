select p1.name from v_persons_male p1
union
select p2.name from v_persons_female p2
order by name