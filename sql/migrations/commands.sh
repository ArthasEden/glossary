# Создать миграцию
# -ext (extension) — расширение файла (.sql)
# -dir (directory) — директория для миграций
# -seq (sequence)  — последовательный номер + имя
migrate create -ext sql -dir migrations -seq init

# Работа с миграцией для конкретной БД по ключу
# up - применить все новые миграции
# down - откатить одну миграцию
# down -all - откатить все миграции
# drop - удалить всё (все таблицы, данные, схемы)
# version - показать текущую версию
# force <version> - принудительно установить версию (без применения миграций). Можно использовать если "version is dirty"
# goto <version> - перейти к конкретной версии (применить/откатить нужные)
#--------------------------------------------------------------------
#?sslmode=disable — это параметр подключения к PostgreSQL, который отключает SSL/TLS шифрование при соединении с базой данных.

migrate -path migrations/ -database "postgres://YouUserName:YourPassword@YoutHostName:5432/YourDataBaseName?sslmode=disable" <key>