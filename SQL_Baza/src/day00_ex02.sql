select "name", "rating" 
from pizzeria
where rating >= 3.5 and rating <= 5
union 
select "name", "rating" 
from pizzeria
where rating between 3.5 and 5