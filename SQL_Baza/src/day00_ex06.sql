select "name", case
	when "name" = 'Denis' then 'true'
	else 'false'
end as "check_name"
FROM person
where "id" = any (select "person_id" 
				from person_order
				where "order_date"='2022-01-07' and 
				("menu_id"=13 or "menu_id"=14 or "menu_id"=18))