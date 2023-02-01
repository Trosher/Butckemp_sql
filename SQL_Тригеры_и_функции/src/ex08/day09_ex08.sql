create or replace function fnc_fibonacci(f integer default 10) returns setof integer as $$
with recursive t(a,b) as 
(
	values(0,1)
	union all 
	select greatest(a,b), a + b as a from t
	where b < f
)
select a from t;
$$ language sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();