create table person_audit
( 
  created timestamp with time zone default NOW() not null,
  type_event char default 'I' not null,
  row_id bigint not null,
  name varchar,
  age integer,
  gender varchar,
  address varchar);
 alter table person_audit add constraint ch_type_event check (type_event in ('I', 'U', 'D'));

create or replace function fnc_trg_person_insert_audit() returns trigger as $fnc_trg_person_insert_audit$
 begin
  insert into person_audit (type_event, row_id, name, age, gender, address)
  values ('I', new.id, new.name, new.age, new.gender, new.address);
  return new;
 end;
$fnc_trg_person_insert_audit$ LANGUAGE plpgsql;

create or replace trigger trg_person_insert_audit
after insert on person
for each row
execute function fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');