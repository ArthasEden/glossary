# Docker — Основные команды

## Containers

# Создать и запустить контейнер
docker run [FLAGS] IMAGE [COMMAND]

# Запуск контейнера в интерактивном режиме
docker run -it IMAGE  # new

# Запуск контейнера в фоне (detached режим)
docker run -d IMAGE  # new

# Запуск контейнера с именем
docker run -d --name NAME IMAGE  # new

# Проброс порта наружу
docker run -p HOST:CONTAINER IMAGE  # new

# Подключение тома
docker run -v HOST_PATH:CONTAINER_PATH IMAGE  # new

# Список запущенных контейнеров (короткая форма)
docker ps

# Список запущенных контейнеров (полная форма)
docker container ls

# Все контейнеры, включая остановленные
docker ps -a

# Запустить остановленный контейнер
docker container start CONTAINER

# Корректная остановка контейнера
docker container stop CONTAINER

# Мгновенная остановка контейнера (SIGKILL)
docker kill CONTAINER  # new

# Перезапустить контейнер
docker container restart CONTAINER

# Выполнить команду в контейнере
docker container exec CONTAINER COMMAND

# Запустить bash внутри работающего контейнера
docker exec -it CONTAINER bash  # new

# Подключение к работающему контейнеру
docker container attach CONTAINER

# Приостановить контейнер
docker container pause CONTAINER

# Возобновить приостановленный контейнер
docker container unpause CONTAINER

# Переименовать контейнер
docker container rename OLD_NAME NEW_NAME

# Просмотр логов контейнера
docker container logs CONTAINER

# Статистика использования ресурсов
docker container stats

# Удалить все остановленные контейнеры
docker container prune

# Показать процессы внутри контейнера
docker container top CONTAINER  # new

# Изменить ресурсы работающего контейнера
docker container update --memory 512m --cpus 1 CONTAINER  # new

---

## Images

# Собрать образ из Dockerfile
docker image build -t NAME .

# Сборка образа в текущей директории
docker build .  # new

# Сборка образа с именем и тегом
docker build . -t NAME:TAG  # new

# Список локальных образов
docker image ls

# Короткая форма списка образов
docker images

# Скачать образ
docker image pull IMAGE

# Скачать образ с Docker Hub
docker pull IMAGE  # new

# Поиск образов на Docker Hub
docker search NAME  # gpt

# Удалить образ
docker image rm IMAGE

# Информация об образе
docker image inspect IMAGE

# Удалить неиспользуемые образы
docker image prune

# Присвоить тег образу
docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]  # new

# Просмотр истории изменений образа
docker history IMAGE  # new

# Сохранить образ в файл
docker save IMAGE > file.tar  # new

# Загрузить образ из файла
docker load < file.tar  # new

---

## Volumes

# Создать том
docker volume create NAME

# Список томов
docker volume ls

# Информация о томе
docker volume inspect NAME

# Кастомный вывод информации о томе
docker volume inspect VOLUME -f 'json .'  # new

# Удалить том
docker volume rm NAME

# Удалить неиспользуемые тома
docker volume prune

---

## Networks

# Создать сеть
docker network create NAME

# Создать сеть с подсетью и шлюзом
docker network create -d bridge --subnet 192.168.10.0/24 --gateway 192.168.10.1 NAME  # new

# Список сетей
docker network ls

# Информация о сети
docker network inspect NAME

# Кастомный вывод информации о сети
docker network inspect NETWORK -f 'json .'  # new

# Подключить контейнер к сети
docker network connect NETWORK CONTAINER

# Отключить контейнер от сети
docker network disconnect NETWORK CONTAINER

# Удалить сеть
docker network rm NAME

---

## Docker Compose

# Запуск сервисов
docker compose up

# Запуск сервисов в фоне
docker compose up -d

# Сборка и запуск сервисов
docker compose up --build  # new

# Список контейнеров
docker compose ps

# Выполнить команду в сервисе
docker compose exec SERVICE COMMAND

# Просмотр логов
docker compose logs

# Перезапуск конкретного сервиса
docker compose restart SERVICE  # new

# Остановить конкретный сервис
docker compose stop SERVICE  # new

# Удалить сервис
docker compose rm SERVICE  # new

# Остановить и удалить сервисы
docker compose down

# Проверка конфигурации Compose
docker compose config  # new

---

## System & Info

# Версия Docker
docker version

# Информация о Docker
docker info

# Использование диска
docker system df

# Подробная информация о диске
docker system df -v  # new

# Статистика всех контейнеров
docker stats

# Просмотр событий в реальном времени
docker system events  # new

# Очистка неиспользуемых ресурсов
docker system prune

# Полная очистка контейнеров, томов и образов
docker system prune -a --volumes  # new

---

## Registries

# Войти в Docker Hub
docker login

# Выйти из Docker Hub
docker logout

# Загрузить образ на Hub
docker push IMAGE

# Скачать образ с Hub
docker pull IMAGE

---

## Flags

# Запустить в фоне
-d, --detach

# Интерактивный режим + терминал
-it

# Задать имя контейнера
--name NAME

# Проброс порта
-p HOST:CONTAINER

# Подключить том
-v HOST_PATH:CONTAINER_PATH  # new

# Переменная окружения
-e KEY=VALUE

# Загрузить переменные из файла
--env-file PATH

# Запуск от имени пользователя
-u USERNAME

# Автоматически удалить при остановке
--rm

# Связать контейнеры
--link CONTAINER:ALIAS

# Подключение к сети
--network NETWORK

# Лимит памяти
-m MEMORY

# Лимит CPU
--cpus COUNT

# Политика перезапуска
--restart POLICY

# Открыть порт внутри контейнера
--expose PORT

# Добавить метку
--label KEY=VALUE

# Рабочая директория
-w /PATH

# Привилегированный режим
--privileged

# UID и GID пользователя
--user UID:GID

# Имя хоста контейнера
--hostname NAME

# DNS сервер
--dns IP