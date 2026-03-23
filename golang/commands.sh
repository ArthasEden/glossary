# Проверить версию Go
go version

# Проверить окружение Go
go env

# Инициализировать новый модуль Go в текущей папке
go mod init {module_name}

# Добавить зависимость (обновить go.mod)
go get {package}

# Обновить все зависимости
go get -u ./...

# Удалить неиспользуемые зависимости
go mod tidy

# Сборка исполняемого файла
go build -o {binary_name} {source_file_or_dir}

# Запуск кода Go
go run {source_file.go}

# Тестирование всех пакетов
go test ./...

# Тестирование конкретного пакета
go test ./{package_name}

# Показывать подробный вывод тестов
go test -v ./...

# Генерация документации для пакета
go doc {package_or_function}

# Профилирование и отладка (pprof)
go tool pprof {binary} {profile_file}  # New

# Форматирование кода
go fmt ./...

# Статический анализ
go vet ./...

# Проверка модулей на уязвимости
go list -m -u all  # New