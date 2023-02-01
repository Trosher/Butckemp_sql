select p.name, m.pizza_name, 
	   m.price, (m.price - (m.price * pd.discounts / 100)) as discount_price, 
	   p2.name as pizzeria_name
from person_order po
join person p on po.person_id = p.id
join menu m on po.menu_id  = m.id
join pizzeria p2 on m.pizzeria_id = p2.id
join person_discounts pd on (pd.person_id = p.id and pd.pizzeria_id = p2.id)
order by p.name, m.pizza_name;
