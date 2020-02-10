#!/bin/bash
FILE=atlassian-confluence-7.3.1-x64.bin
if test -f "$FILE"; then
    echo "$FILE EXIST"

    sudo usermod -aG sudo vagrant
    apt-get -y update

    #INSTALL AND CONFIGURE MYSQL SERVER

    apt-get -y install mysql-server
    sudo systemctl start mysql.service
    sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
    FLUSH PRIVILEGES;
    CREATE DATABASE CONFLUENCE CHARACTER SET utf8 COLLATE utf8_bin;
    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;"
    sudo sed -i "s/.*bind-address.*/bind-address =      0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
    sudo echo transaction-isolation=READ-COMMITTED >> /etc/mysql/mysql.conf.d/mysqld.cnf
    sudo systemctl restart mysql.service
    
    #INSTALL CONFLUENCE

    chmod a+x atlassian-confluence-7.3.1-x64.bin
    ./atlassian-confluence-7.3.1-x64.bin -q -varfile confluence-response.varfile
    
    #DOWNLOAD AND COPY MYSQL JDBC DRIVER
    
    wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.48.tar.gz
    tar -xvf mysql-connector-java-5.1.48.tar.gz -silent
    cp /home/vagrant/mysql-connector-java-5.1.48/mysql-connector-java-5.1.48.jar /opt/atlassian/confluence/lib
    sudo systemctl start confluence.service
else 
    echo $FILE DOES NOT EXIST
fi

