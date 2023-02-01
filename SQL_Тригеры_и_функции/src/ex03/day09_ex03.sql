create or replace function fnc_trg_person_audit() returns trigger as $fnc_trg_person_audit$
 begin
  IF (TG_OP = 'DELETE') THEN
	  insert into person_audit (type_event, row_id, name, age, gender, address)
	  values ('D', old.id, old.name, old.age, old.gender, old.address);
	  return old;
  ELSIF (TG_OP = 'UPDATE') THEN 
	  insert into person_audit (type_event, row_id, name, age, gender, address)
	  values ('U', old.id, old.name, old.age, old.gender, old.address);
	  return old;
  ELSIF (TG_OP = 'INSERT') THEN
	  insert into person_audit (type_event, row_id, name, age, gender, address)
	  values ('I', new.id, new.name, new.age, new.gender, new.address);
	  return new;
  end if;
 end;
$fnc_trg_person_audit$ LANGUAGE plpgsql;

create or replace trigger trg_person_audit
BEFORE INSERT OR UPDATE OR DELETE on person
for each row
execute function fnc_trg_person_audit();


drop trigger if exists trg_person_insert_audit on person;
drop trigger if exists trg_person_update_audit on person;
drop trigger if exists trg_person_delete_audit on person;
drop function if exists fnc_trg_person_insert_audit;
drop function if exists fnc_trg_person_update_audit;
drop function if exists fnc_trg_person_delete_audit;
DELETE from person_audit
where type_event = type_event;

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;