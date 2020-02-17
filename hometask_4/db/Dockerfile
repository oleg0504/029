FROM ubuntu:18.04

ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y update
RUN apt-get -y install mysql-server
RUN /etc/init.d/mysql start
RUN    sed -i "s/.*bind-address.*/bind-address =      0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
RUN /etc/init.d/mysql restart


EXPOSE 3306

CMD ["mysqld_safe"]




