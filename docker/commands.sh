# Проверить версию Docker
docker --version

# Проверить информацию о Docker (версии, конфигурация)
docker info  # New

# Список всех контейнеров (включая остановленные)
docker ps -a

# Список только запущенных контейнеров
docker ps

# Запустить контейнер из образа {image_name} с именем {container_name} и интерактивной консолью
docker run -it --name {container_name} {image_name}

# Запустить контейнер в фоне (detached mode)
docker run -d --name {container_name} {image_name}

# Запустить контейнер с пробросом портов {host_port}:{container_port}
docker run -d -p {host_port}:{container_port} --name {container_name} {image_name}

# Список всех образов
docker images

# Скачать (pull) образ из Docker Hub или другого реестра
docker pull {image_name}

# Отправить (push) образ в реестр
docker push {image_name}

# Создать образ из Dockerfile в текущей папке с тегом {image_name}:{tag}
docker build -t {image_name}:{tag} .

# Удалить контейнер {container_name} (текущий остановленный)
docker rm {container_name}

# Принудительно удалить контейнер {container_name}, если он запущен
docker rm -f {container_name}  # New

# Удалить образ {image_name}:{tag}
docker rmi {image_name}:{tag}

# Удалить все остановленные контейнеры и неиспользуемые образы, тома, сети
docker system prune -a  # New

# Подключиться к работающему контейнеру {container_name} в интерактивный режим
docker exec -it {container_name} /bin/bash

# Просмотр логов контейнера {container_name}
docker logs {container_name}

# Просмотр последних N строк логов контейнера {container_name}
docker logs --tail N {container_name}  # New

# Следить за логами контейнера в реальном времени
docker logs -f {container_name}

# Остановить контейнер {container_name}
docker stop {container_name}

# Перезапустить контейнер {container_name}
docker restart {container_name}

# Список всех сетей Docker
docker network ls

# Создать новую сеть Docker {network_name}
docker network create {network_name}  # New

# Подключить контейнер к сети
docker network connect {network_name} {container_name}  # New

# Отсоединить контейнер от сети
docker network disconnect {network_name} {container_name}  # New

# Список всех томов Docker
docker volume ls

# Создать том Docker {volume_name}
docker volume create {volume_name}  # New

# Подключить том к контейнеру
docker run -v {volume_name}:{container_path} {image_name}  # New

# Удалить том Docker {volume_name}
docker volume rm {volume_name}  # New

# Получить подробную информацию о контейнере {container_name}
docker inspect {container_name}  # New