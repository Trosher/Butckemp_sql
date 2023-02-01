create view v_symmetric_union
as
	with S as
	(
		select person_id from person_visits pv
		where pv.visit_date = '2022-01-06'
	),
	R as 
	(
		select person_id from person_visits pv
		where pv.visit_date = '2022-01-02'
	),
	R_S as
	(
		select * from R 
		EXCEPT
		select * from S 
	),
	S_R as
	(
		select * from S
		EXCEPT
		select * from R
	)
	select * from R_S
	union
	select * from S_R
	order by person_id