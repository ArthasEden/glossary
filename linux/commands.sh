# 1. Работа с файловой системой

# Текущая директория
pwd

# Список файлов и папок
ls -la

# Перейти в директорию
cd {directory}

# Создать новую папку
mkdir {folder_name}

# Создать новый файл
touch {file_name}

# Удалить файл
rm {file_name}

# Удалить папку рекурсивно
rm -rf {folder_name}

# Копировать файл или папку
cp {source} {destination}

# Переместить файл или папку
mv {source} {destination}

# Просмотреть содержимое файла
cat {file_name}

# Постраничный просмотр файла
less {file_name}

# Найти текст в файле
grep "text" {file_name}

# Найти файл в директории
find . -name "{file_pattern}"

# Сравнить два файла
diff {file1} {file2}  # New

# 2. Управление процессами

# Показать все процессы
ps aux

# Показать процессы с фильтром
ps aux | grep {process_name}

# Мониторинг ресурсов в реальном времени
top

# Более удобный мониторинг (если установлен htop)
htop  # New

# Убить процесс по PID
kill {pid}

# Принудительно убить процесс
kill -9 {pid}

# 3. Работа с пакетами (Ubuntu/Debian)

# Обновить список пакетов
sudo apt update

# Установить пакет
sudo apt install {package_name}

# Удалить пакет
sudo apt remove {package_name}

# Удалить неиспользуемые пакеты
sudo apt autoremove  # New

# Найти пакет
apt search {package_name}

# 4. Сеть

# Показать IP-адреса
ip a

# Проверить доступность хоста
ping {host}

# Просмотреть открытые порты
ss -tuln  # New

# Проверить соединения по порту
lsof -i :{port}

# Скачать файл из интернета
wget {url}

# Альтернатива wget
curl -O {url}

# 5. Архивы и сжатие

# Разархивировать tar.gz
tar -xzf {archive}.tar.gz

# Создать tar.gz архив
tar -czf {archive}.tar.gz {folder}

# Разархивировать zip
unzip {file.zip}

# Создать zip архив
zip -r {archive.zip} {folder}  # New

# 6. Система, память, диски

# Показать свободное место на диске
df -h

# Показать использование памяти
free -h

# Показать права доступа к файлу
ls -l {file_name}

# Изменить права доступа
chmod 755 {file_name}

# Изменить владельца файла
chown {user}:{group} {file_name}

# Просмотреть список последних команд
history

# Очистить терминал
clear

# 7. Администрирование / DevOps / логирование

# Просмотр логов systemd для всех сервисов
journalctl -xe  # New

# Просмотр логов конкретного сервиса
journalctl -u {service_name}  # New

# Следить за логами сервиса в реальном времени
journalctl -u {service_name} -f  # New

# Следить за любым лог-файлом в реальном времени
tail -f {log_file}  # New

# Просмотреть последние N строк лог-файла
tail -n {N} {log_file}  # New

# Проверить статус сервиса
systemctl status {service_name}

# Запустить сервис
sudo systemctl start {service_name}

# Перезапустить сервис
sudo systemctl restart {service_name}

# Остановить сервис
sudo systemctl stop {service_name}

# Включить автозапуск сервиса
sudo systemctl enable {service_name}

# Отключить автозапуск сервиса
sudo systemctl disable {service_name}

# Просмотр активных соединений на сервере
netstat -tulnp  # New

# Альтернатива для netstat (современный инструмент)
ss -tulnp  # New

# Мониторинг использования ресурсов по процессу
pidstat -p {pid} 1  # New

# Мониторинг загрузки CPU и памяти по процессам
top
htop  # New