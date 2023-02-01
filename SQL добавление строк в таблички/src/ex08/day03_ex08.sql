INSERT INTO menu
VALUES ((select max(m.id + 1) from menu m), 
		(SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name = 'Dominos'), 
		'sicilian pizza', 900);