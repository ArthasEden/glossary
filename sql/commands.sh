# Создать БД с владельцем по умолчанию (postgres)
sudo -u postgres createdb <database_name>

# Создать БД с указанием владельца
sudo -u postgres createdb <database_name> -O <owner_name>

# Создать нового пользователя PostgreSQL
sudo -u postgres createuser <username>

# Удалить пользователя PostgreSQL
sudo -u postgres dropuser <username>

# Показать список БД
sudo -u postgres psql -l

# Подключиться к БД от имени системного пользователя postgres
sudo -u postgres psql -d <database_name>

# Подключиться к БД от имени конкретного пользователя PostgreSQL
sudo -u postgres psql -d <database_name> -U <username>

# Удалить БД
sudo -u postgres dropdb <database_name>

# Проверить статус PostgreSQL
sudo systemctl status postgresql@16-main.service

# Перезапустить PostgreSQL
sudo systemctl restart postgresql@16-main.service

# Посмотреть логи
sudo tail -f /var/log/postgresql/postgresql-16-main.log

# Задать пароль пользователю arthas в PostgreSQL
sudo -u postgres psql -c "ALTER USER arthas WITH PASSWORD 'ваш_пароль';"

# Подключиться через pgAdmin или любым клиентом
# Хост: localhost
# Порт: 5432
# База: study
# Пользователь: arthas
# Пароль: ваш_пароль
psql -h localhost -p 5432 -d study -U arthas