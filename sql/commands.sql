-- CREATE TABLE: создание новой таблицы с колонками и типами данных
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,             -- Уникальный идентификатор
    name VARCHAR(100) NOT NULL,        -- Имя сотрудника
    department_id INT NOT NULL,        -- ID отдела
    salary NUMERIC(10,2) DEFAULT 0,    -- Зарплата
    hired_at TIMESTAMP DEFAULT NOW(),  -- Дата найма
    info JSONB                         -- Дополнительные данные в формате JSON
);

-- ALTER TABLE: изменение структуры таблицы (добавление столбца)
ALTER TABLE employees ADD COLUMN skills TEXT[];  -- Массив навыков

-- ALTER TABLE: переименование столбца
ALTER TABLE employees RENAME COLUMN name TO full_name;

-- ALTER TABLE: переименование таблицы
ALTER TABLE employees RENAME TO staff;

-- DROP TABLE: удалить таблицу
DROP TABLE staff;

-- INSERT INTO: вставка новых записей в таблицу
INSERT INTO staff (full_name, department_id, salary) 
VALUES ('Ivan Ivanov', 1, 75000);

-- INSERT INTO с JSONB: вставка данных в JSONB поле
INSERT INTO staff (full_name, department_id, salary, info)
VALUES ('Olga Ivanova', 3, 90000, '{"position":"Manager","remote":true}');

-- INSERT INTO с массивом: запись навыков в массив
INSERT INTO staff (full_name, department_id, salary, skills)
VALUES ('Sergey Petrov', 2, 75000, ARRAY['Go','Docker','Linux']);

-- UPDATE: обновление данных в таблице
UPDATE staff SET salary = salary * 1.1 WHERE id = 1;

-- UPDATE с JSONB: изменение конкретного поля JSONB
UPDATE staff SET info = jsonb_set(info, '{remote}', 'false', true) WHERE id = 1;

-- UPDATE с массивом: добавить новый элемент в массив
UPDATE staff SET skills = array_append(skills, 'Kubernetes') WHERE id = 2;

-- DELETE FROM: удаление записей из таблицы
DELETE FROM staff WHERE id = 1;

-- SELECT: выбор данных из таблицы
SELECT * FROM staff;

-- SELECT с фильтром и конкретными колонками
SELECT full_name, salary FROM staff WHERE salary > 50000;

-- SELECT с JSONB: доступ к полям JSONB
SELECT full_name, info->>'position' AS position FROM staff WHERE info->>'remote'='true';

-- UNNEST: развёртывание массива в строки
SELECT full_name, unnest(skills) AS skill FROM staff;

-- CREATE INDEX: создание индекса для ускорения поиска
CREATE INDEX idx_department_id ON staff(department_id);

-- DROP INDEX: удалить индекс
DROP INDEX idx_department_id;

-- SELECT pg_indexes: посмотреть все индексы таблицы
SELECT * FROM pg_indexes WHERE tablename='staff';

-- BEGIN / COMMIT / ROLLBACK: работа с транзакциями
BEGIN;   -- Начало транзакции
UPDATE staff SET salary = salary + 1000 WHERE id = 1;
INSERT INTO staff(full_name, department_id, salary) VALUES('Petr Petrov', 2, 60000);
COMMIT;  -- Подтвердить изменения
ROLLBACK; -- Отменить изменения

-- JOIN: объединение таблиц по условию
SELECT s.full_name, d.name AS department_name
FROM staff s
INNER JOIN departments d ON s.department_id = d.id;

-- LEFT JOIN: все записи из левой таблицы + совпадения с правой
SELECT s.full_name, d.name AS department_name
FROM staff s
LEFT JOIN departments d ON s.department_id = d.id;

-- RIGHT JOIN: все записи из правой таблицы + совпадения с левой
SELECT s.full_name, d.name AS department_name
FROM staff s
RIGHT JOIN departments d ON s.department_id = d.id;

-- FULL OUTER JOIN: объединение всех записей обеих таблиц
SELECT s.full_name, d.name AS department_name
FROM staff s
FULL OUTER JOIN departments d ON s.department_id = d.id;

-- SELF JOIN: соединение таблицы самой с собой
SELECT a.full_name AS emp1, b.full_name AS emp2, a.department_id
FROM staff a
INNER JOIN staff b ON a.department_id = b.department_id AND a.id <> b.id;

-- GROUP BY: группировка данных с агрегатами
SELECT department_id, AVG(salary) AS avg_salary, COUNT(*) AS employees_count
FROM staff
GROUP BY department_id
HAVING AVG(salary) > 50000;

-- CTE (WITH): создание временной результирующей таблицы для сложных запросов
WITH high_salary AS (SELECT * FROM staff WHERE salary > 70000)
SELECT full_name, salary FROM high_salary;

-- Рекурсивный CTE: построение иерархии сотрудников
WITH RECURSIVE emp_hierarchy AS (
    SELECT id, full_name, manager_id FROM staff WHERE manager_id IS NULL
    UNION ALL
    SELECT s.id, s.full_name, s.manager_id
    FROM staff s
    JOIN emp_hierarchy h ON s.manager_id = h.id
)
SELECT * FROM emp_hierarchy;

-- UPSERT (INSERT ON CONFLICT): вставка или обновление при конфликте
INSERT INTO staff(full_name, department_id, salary)
VALUES ('Anna Smirnova', 2, 80000)
ON CONFLICT (id) DO UPDATE SET salary = EXCLUDED.salary;

-- Оконные функции (OVER): вычисления по разделам и порядку
SELECT full_name, department_id, salary,
       RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS rank_in_dept,
       SUM(salary) OVER(PARTITION BY department_id) AS total_salary_in_dept,
       AVG(salary) OVER(PARTITION BY department_id) AS avg_salary_in_dept;

-- CASE: условное выражение для вычисления новых значений
SELECT full_name, salary,
       CASE
           WHEN salary < 50000 THEN 'Low'
           WHEN salary BETWEEN 50000 AND 80000 THEN 'Medium'
           ELSE 'High'
       END AS salary_level
FROM staff;

-- CREATE USER: создание нового пользователя
CREATE USER app_user WITH PASSWORD 'secure_pass';

-- DROP USER: удаление пользователя
DROP USER app_user;

-- GRANT: дать права на базу
GRANT ALL PRIVILEGES ON DATABASE company_db TO app_user;

-- REVOKE: забрать права у пользователя
REVOKE ALL PRIVILEGES ON DATABASE company_db FROM app_user;

-- ALTER USER: сделать суперпользователем
ALTER USER app_user WITH SUPERUSER;

-- ALTER USER: убрать права суперпользователя
ALTER USER app_user WITH NOSUPERUSER;

-- pg_stat_activity: показать активные подключения
SELECT * FROM pg_stat_activity;

-- pg_locks: показать заблокированные объекты
SELECT * FROM pg_locks;

-- pg_database_size: размер всех баз данных
SELECT datname, pg_database_size(datname) FROM pg_database;

-- pg_tables: список таблиц в public схеме
SELECT * FROM pg_tables WHERE schemaname='public';

-- version(): проверить версию PostgreSQL
SELECT version();