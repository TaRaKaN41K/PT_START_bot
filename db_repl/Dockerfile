# Используем базовый образ PostgreSQL
FROM postgres:14

# Установка переменных окружения для репликации
ENV PGUSER=repl_user
ENV PGPASSWORD=repl_user
ENV PGHOST=postgres

# Открытие порта для PostgreSQL реплики
EXPOSE 5432

# Команда для настройки реплики и запуска реплики
CMD bash -c "
    rm -rf /var/lib/postgresql/data/* && \
    pg_basebackup -h \$PGHOST -D /var/lib/postgresql/data -R --slot=replication_slot && \
    chown -R postgres:postgres /var/lib/postgresql/data && chmod 0700 /var/lib/postgresql/data && \
    postgres
"