# Используем базовый образ PostgreSQL
FROM postgres:14

# Копируем SQL-скрипт для инициализации базы данных
COPY init.sql /docker-entrypoint-initdb.d/
