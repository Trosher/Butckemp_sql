select pvd.generate_date as missing_date from v_generated_dates pvd
where pvd.generate_date not in (select pv.visit_date from person_visits pv)
order by missing_date