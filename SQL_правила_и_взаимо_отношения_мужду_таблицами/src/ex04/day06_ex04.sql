ALTER TABLE person_discounts
ADD constraint ch_nn_person_id CHECK (person_id is not null);

ALTER TABLE person_discounts
ADD constraint ch_nn_pizzeria_id CHECK (pizzeria_id is not null);

ALTER TABLE person_discounts
ADD constraint ch_nn_discount CHECK (discounts is not null);

ALTER TABLE person_discounts
ALTER discounts SET DEFAULT 0;

ALTER TABLE person_discounts
ADD constraint ch_range_discount CHECK (discounts <= 100 and discounts >= 0);