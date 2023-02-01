INSERT INTO person_visits VALUES ((select max(pv.id + 1) from person_visits pv), (select p.id  from person p where p.name = 'Denis'),
		(SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name = 'Dominos'), 
		'2022-02-24'),
		((select max(pv.id + 2) from person_visits pv), (select p.id  from person p where p.name = 'Elvira'),
		(SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name = 'Dominos'), 
		'2022-02-24');