select menu.pizza_name
FROM menu
union
select menu.pizza_name
FROM menu
order by pizza_name desc