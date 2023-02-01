begin transaction; -- Запуск транзакций в обоих сесиях

set transaction isolation level repeatable read; -- устоновка нужного уровня изоляции на обоих сессиях

show transaction isolation level; -- смотрим уровень изоляции в обоих сесиях

select * from pizzeria WHERE name = 'Pizza Hut'; -- выводим необходимую информацию в двух сессиях 

UPDATE pizzeria -- Запрос на обновление данных в первой сесси
SET rating = 4
WHERE name = 'Pizza Hut';

UPDATE pizzeria -- Запрос на обновление данных в второй сесси
SET rating = 3.6
WHERE name = 'Pizza Hut';

commit; -- Применение изменений

select * from pizzeria WHERE name = 'Pizza Hut'; -- выводим необходимую информацию в обоих сесиях
