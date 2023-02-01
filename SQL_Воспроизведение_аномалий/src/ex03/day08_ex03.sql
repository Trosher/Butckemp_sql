begin transaction; -- Запуск транзакций в обоих сесиях

select * from pizzeria WHERE name = 'Pizza Hut'; -- выводим необходимую информацию в первой сессии

UPDATE pizzeria -- Запрос на обновление данных в второй сесси
SET rating = 3.6
WHERE name = 'Pizza Hut';

commit; -- Применение изменений второй сессии

select * from pizzeria WHERE name = 'Pizza Hut'; -- выводим необходимую информацию в первой сессии

commit; -- Применение изменений первой сессии

select * from pizzeria WHERE name = 'Pizza Hut'; -- выводим необходимую информацию в первой сессии

select * from pizzeria WHERE name = 'Pizza Hut'; -- выводим необходимую информацию в второй сессии