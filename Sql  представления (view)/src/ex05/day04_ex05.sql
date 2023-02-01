create view v_price_with_discount
as
	with po_p_m as
	(
		select p.name, m.pizza_name, m.price, ROUND(m.price - m.price * 0.1) as discount_price 
		from person_order po
		join person p on po.person_id = p.id 
		join menu m on po.menu_id = m.id
	)
	select po_p_m.name, po_p_m.pizza_name, po_p_m.price, po_p_m.discount_price
	from po_p_m
	order by po_p_m.name, po_p_m.pizza_name