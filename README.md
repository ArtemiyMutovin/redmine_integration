# redmine_integration
```
1. cp .env.example .env
2. подставить BRIGHT_SOFT_LOGIN, BRIGHT_SOFT_PASSWORD, BRIGHT_SOFT_URL для интеграции
3. bundle
4. load "bright_soft.rb" внутри irb консоли
5. client = BrightSoft.new - инициализация клиента
6. client.create_issue - создание записи (задачи)
7. client.update_issue - изменение атрибутивного состава задачи
8. client.delete_issue - удаление записи (задачи) по ключу
```
