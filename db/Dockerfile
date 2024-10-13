FROM postgres:14

RUN apt-get update
RUN apt-get install gettext-base

COPY ./init.sql /docker-entrypoint-initdb.d/init.sql.raw
RUN mkdir -p /etc/postgresql/
RUN mkdir -p /oracle/pgdata/archive/
RUN chown postgres:postgres /oracle/pg_data/archive/

ENTRYPOINT [ "bash", "-c", "\ 
mkdir -p /var/log/postgresql/ \n\ 
chown postgres:postgres /var/log/postgresql/ \n\
envsubst < /docker-entrypoint-initdb.d/init.sql.raw > /docker-entrypoint-initdb.d/init.sql \n\ 
cat <<EOF > /etc/postgresql/postgresql.conf \n\
listen addresses = '*' \n\
port = $(DB_PORT} \n\
log destination = 'stderr' \n\
logging_collector = on \n\
log directory = /var/log/postgresql/' \n\
log filename = 'postgresql.log' \n\
archive_mode = on \n\
archive command = 'cp sp /oracle/pg_data/archive/®f' \n\
max wal_senders = 10 \n\
wal level = replica \n\
wal_ log hints = on \n\
Log_replication_commands = on \n\
EOF\n\
cat <<EOF > /etc/postgresql/pg_hba.conf \n\
local all ${POSTGRES USER} peer \n\ 
host all all 0.0.0.0/0 password \n\ 
host replication ${DB_REPL_USER} $(DB_REPL_ HOST} trust \n\
EOF\n\
docker-entrypoint.sh $@"]

CMD ["postgres", "-C", "config_file=/etc/postgresql/postgresql.conf", "-C", "hba_file=/etc/postgresql/pg_hba.conf" ]