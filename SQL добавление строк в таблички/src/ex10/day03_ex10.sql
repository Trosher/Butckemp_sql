INSERT INTO person_order VALUES 
		((select max(po.id + 1) from person_order po), (select p.id  from person p where p.name = 'Denis'),
		(SELECT m.id FROM menu m WHERE m.pizza_name  = 'sicilian pizza'), 
		'2022-02-24'),
		((select max(po.id + 2) from person_order po), (select p.id  from person p where p.name = 'Elvira'),
		(SELECT m.id FROM menu m WHERE m.pizza_name  = 'sicilian pizza'), 
		'2022-02-24');