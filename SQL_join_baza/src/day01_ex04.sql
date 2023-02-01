SELECT person_order.person_id
FROM person_order
where person_order.order_date='2022-01-07'
except all
SELECT person_visits.person_id
FROM person_visits
where person_visits.visit_date='2022-01-07'
