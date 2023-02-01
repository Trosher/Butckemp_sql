begin transaction; -- Запуск транзакций в обоих сесиях

set transaction isolation level repeatable read; -- устоновка нужного уровня изоляции на обоих сессиях

show transaction isolation level; -- смотрим уровень изоляции в обоих сесиях

UPDATE pizzeria -- Запрос на обновление данных в первой сесси
SET rating = 3.8
WHERE id = 1;

UPDATE pizzeria -- Запрос на обновление данных в второй сесси
SET rating = 1.1
WHERE id = 2;

UPDATE pizzeria -- Запрос на обновление данных в первой сесси
SET rating = 5
WHERE id = 2;

UPDATE pizzeria -- Запрос на обновление данных в второй сесси
SET rating = 8
WHERE id = 1;

commit; -- Применение изменений к обоим сессиям

select * from pizzeria 