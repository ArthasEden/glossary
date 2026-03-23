# Проверить версию Git
git --version

# Настроить глобальное имя пользователя {user_name}, которым будут подписываться коммиты
git config --global user.name "{user_name}"

# Настроить глобальный email пользователя {user_email}, которым будут подписываться коммиты
git config --global user.email "{user_email}"

# Посмотреть все текущие настройки Git
git config --list

# Инициализировать локальный Git репозиторий в текущей папке
git init

# Склонировать удалённый репозиторий себе на локальную машину
git clone "{ssh_link.git}"

# Подключить удалённый репозиторий по ссылке {ssh_link.git} с именем origin
git remote add origin {ssh_link.git}

# Посмотреть удалённые репозитории, привязанные к локальному
git remote -v

# Скачивание всех данных с удалённого репозитория
git fetch --all

# Создать SSH ключи для безопасного доступа к удалённому репозиторию
ssh-keygen -t rsa  # New

# Проверить статус локального репозитория
git status

# Посмотреть список локальных веток
git branch

# Посмотреть все ветки, включая удалённые
git branch -a

# Создать новую ветку {branch_name} в локальном репозитории
git branch {branch_name}

# Создать новую ветку {branch_name} от удалённой ветки {remote_branch} и сразу на неё переключиться
git checkout -b {branch_name} {remote_branch}

# Переключиться на ветку {branch_name} или коммит {commit_hash}
git checkout {branch_name|commit_hash}

# Переименовать текущую ветку в {new_branch_name}
git branch -m {new_branch_name}

# Удалить локальную ветку {branch_name} (текущую ветку удалить нельзя)
git branch -d {branch_name}

# Добавить перечисленные файлы в предстоящий коммит
git add {files}

# Добавить все файлы в предстоящий коммит
git add . 

# Сделать коммит с комментарием {commit_comment}
git commit -m "{commit_comment}"

# Просмотреть историю коммитов
git log

# Слить ветку {feature_branch_name} в текущую ветку
git merge {feature_branch_name}

# Создать коммит с исправлениями и автоматически добавить все изменённые файлы # New
git commit -a -m "{commit_comment}"  # New

# Отправить новые локальные коммиты в удалённый репозиторий и установить upstream
git push -u origin {branch_name}

# Отправить изменения локальной ветки на удалённый репозиторий
git push

# Получить изменения с удалённой ветки и слить их с локальной
git pull

# Просмотреть различия между текущими изменениями и последним коммитом # New
git diff  # New

# Просмотреть различия между локальной и удалённой веткой # New
git diff origin/{branch_name}  # New

# Отменить изменения в файле до последнего коммита # New
git restore {file}  # New

# Отменить все изменения в рабочем каталоге до последнего коммита # New
git reset --hard  # New

# Удалить файл из Git, но оставить на диске # New
git rm --cached {file}  # New