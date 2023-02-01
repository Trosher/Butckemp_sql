create unique index idx_person_discounts_unique
	on person_discounts (person_id, pizzeria_id);

set enable_seqscan = off;

EXPLAIN analyze
SELECT pizzeria_id, person_id
FROM person_discounts;