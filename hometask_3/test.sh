#!/bin/bash
FILE=atlassian-confluence-7.3.1-x64.bin
if test -f "$FILE"; then
    echo "$FILE exist"

    apt-get -y update
    apt-get -y install mysql-server
    sudo systemctl start mysql.service
    #sudo systemctl enable mysql.service
    sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
    FLUSH PRIVILEGES;
    CREATE DATABASE CONFLUENCE;
    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;"
    sudo sed -i "s/.*bind-address.*/bind-address =      0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
    sudo systemctl restart mysql.service
    chmod a+x atlassian-confluence-7.3.1-x64.bin
    sudo ./atlassian-confluence-7.3.1-x64.bin -q -varfile confluence-response.varfile

else 
    echo $FILE DOES NOT EXIST
fi

