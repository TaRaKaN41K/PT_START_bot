FROM postgres: 14

RUN mkdir -p /etc/postgresql/
RUN chmod 750 /var/lib/postgresql/data

ENTRYPOINT [ "bash", "-c", "\
cat <<EOF > /etc/postgresql/postgresql.conf \n\
listen_addresses = 'localhost, ${DB_REPL_HOST}' \n\
port = ${DB_REPL_PORT} \n\
EOF\n\
rm -rf /var/lib/postgresql/data/* \n\ 
sleep 10 \n\
echo ${DB REPL PASSWORD} | pg basebackup -v -R \\\n\
	-h $(DB HOST} -p $(DB_PORT) -U ${DB REPL USER} -W -P \\\n\
	-D /var/lib/postgresql/data \n\ 
docker-entrypoint.sh $@"]

CMD ["postgres", "-c", "config_ file=/etc/postgresql/postgresql.conf"]