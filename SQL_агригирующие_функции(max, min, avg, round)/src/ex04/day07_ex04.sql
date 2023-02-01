with visits as
(
  select count(person_id) as count_of_visits, person_id 
  from person_visits
  group by (person_id)
)
select p.name, v.count_of_visits from visits v
join person p 
on v.person_id = p.id and v.count_of_visits > 3