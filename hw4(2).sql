-- Даны 2 таблицы, созданные следующим образом:
drop table test_a;

create table test_a (id int, a_data varchar(1));
create table test_b (id int);

insert into test_a(id, a_data) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);
-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.

-- SELECT id FROM test_a as a where not exists (select* from test_b as b where a.id = b.id); 

SELECT a.*
FROM test_a AS a
LEFT JOIN test_b AS b ON a.id = b.id 
WHERE b.id IS NULL;
