# Подключиться к базе
psql -U {user} -h {host} -d {db_name}

# Подключиться к локальной базе без указания имени
psql -U {user}

# Выйти из psql
\q

# Список баз
\l

# Переключиться на другую базу
\c {db_name}

# Создать базу данных
createdb {db_name}

# Удалить базу данных
dropdb {db_name}

# Сделать резервную копию базы
pg_dump -U {user} -h {host} -d {db_name} > backup.sql

# Восстановить базу из резервной копии
psql -U {user} -h {host} -d {db_name} < backup.sql

# Выполнить SQL из файла
\i {file.sql}

# Показать информацию о соединении
\conninfo

# Показать список пользователей и ролей
\du