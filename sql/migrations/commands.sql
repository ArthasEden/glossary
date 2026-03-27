-- 000001_init.down.sql
DROP TABLE users;
-- 000001_init.up.sql
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    number VARCHAR(100)
);

--000002_not_null.down.sql
ALTER TABLE users ALTER COLUMN number DROP NOT NULL;
--000002_not_null.up.sql
ALTER TABLE users ALTER COLUMN number SET NOT NULL;

/*
CONSTRAINT — это ограничение в таблице, которое задаёт правила для данных.
Типы ограничений:
    PRIMARY KEY — уникальный идентификатор строки.
    UNIQUE — значения столбца (или комбинации столбцов) должны быть уникальны.
    NOT NULL — значение не может быть пустым.
    CHECK — условие, которому должна удовлетворять запись.
    FOREIGN KEY — ссылка на другую таблицу.
*/
--000003_unique.down.sql
ALTER TABLE users DROP CONSTRAINT users_number_unique;
--000003_unique.up.sql
ALTER TABLE users ADD CONSTRAINT users_number_unique UNIQUE(NUMBER);