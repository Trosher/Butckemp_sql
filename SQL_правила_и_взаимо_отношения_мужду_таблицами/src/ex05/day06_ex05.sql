COMMENT ON TABLE person_discounts
    IS 'The table is used to store personal customer discounts and quickly apply them to product prices.';
    
COMMENT ON column person_discounts.id
    IS 'The column representing the primary key.';
    
COMMENT ON column person_discounts.person_id
    IS 'The foreign key corresponding to the client.';
    
COMMENT ON column person_discounts.pizzeria_id
    IS 'The foreign key corresponding to the pizzeria.';
    
COMMENT ON column person_discounts.discounts
    IS 'A column that stores a discount that belongs to a client in a certain pizzeria.';