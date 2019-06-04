FROM mariadb

ENV MYSQL_ROOT_PASSWORD password

ADD ["mysqlconf/gatewaymy.cnf", "/etc/mysql/conf.d/conf_mysql.cnf"]

RUN	mkdir /tmp/restore

RUN	chmod 644 /tmp/restore

ADD ["./bd.sql", "/tmp/restore/bd.sql"]

EXPOSE 3306

CMD ["mysqld"]

RUN   mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE db_test" && \
    	mysql -u root -p${MYSQL_ROOT_PASSWORD} -D db_test < /tmp/restore/bd.sql && \
    	rm -rf /tmp/restore/* && \
