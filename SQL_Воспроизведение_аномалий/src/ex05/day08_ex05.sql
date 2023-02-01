begin transaction; -- Запуск транзакций в обоих сесиях

select sum(rating) from pizzeria; -- выводим необходимую информацию в первой сессии

UPDATE pizzeria -- Запрос на обновление данных в второй сесси
SET rating = 1
WHERE name = 'Pizza Hut';

commit; -- Применение изменений второй сессии

select sum(rating) from pizzeria; -- выводим необходимую информацию в первой сессии

commit; -- Применение изменений первой сессии

select sum(rating) from pizzeria; -- выводим необходимую информацию в первой сессии

select sum(rating) from pizzeria; -- выводим необходимую информацию в второй сессии