with global_rating as
(
	select round(avg(p.rating),4) as global_rating from pizzeria p 
)
select global_rating
from global_rating;