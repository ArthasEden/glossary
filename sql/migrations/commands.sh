# Создать миграцию
# -ext (extension) — расширение файла (.sql)
# -dir (directory) — директория для миграций
# -seq (sequence)  — последовательный номер + имя
migrate create -ext sql -dir migrations -seq init

# Применить миграции
# -path     — путь к папке с миграциями
# -database — строка подключения к БД
# up        — применить миграции
# <номер>   — количество миграций (опционально)
migrate -path migrations/ -database "postgres://user:pass@localhost:5432/db?sslmode=disable" up

# Откатить миграции
# down      — откатить миграции
migrate -path migrations/ -database "postgres://user:pass@localhost:5432/db?sslmode=disable" down

# Принудительно установить версию миграции (сбросить dirty state)
# force <версия> — установить указанную версию без применения миграций
migrate -path migrations/ -database "postgres://user:pass@localhost:5432/db?sslmode=disable" force 0

# Удалить все таблицы из БД (включая schema_migrations)
migrate -path migrations/ -database "postgres://user:pass@localhost:5432/db?sslmode=disable" drop