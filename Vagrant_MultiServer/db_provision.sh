#!/bin/bash
#provision DBBox Version 0.0.0
# Edited by Jessica Rankins 4/17/2017


rm -f postinstall.sh

apt-get update
# mysql 유저 설정
# mysql username: root
# mysql password: rootpass
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password rootpass'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password rootpass'

# db서버의 역할을 하기 위한 패키지 설치
apt-get -y install mysql-server php5-mysql

sed -i "s/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" "/etc/mysql/my.cnf"

# Allow root access from any host 이 사람(root, rootpass)이 원격으로 접속할 수 있다고 허용해 주겠다
# 이게 없으면 로컬에서만 접속되고 원격에서는 안 된다
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'rootpass' WITH GRANT OPTION; FLUSH PRIVILEGES;" | mysql -u root --password=rootpass
#echo "GRANT PROXY ON ''@'' TO 'root'@'%' WITH GRANT OPTION" | mysql -u root --password=rootpass
sudo service mysql restart

# Create database for form responses (WebExampleBox) DB 테이블 생성
#DB Server->MySQL(DBMS)->formresponses(DB)->table1,table2...(schema)
mysql -uroot -p'rootpass' -e "DROP DATABASE IF EXISTS formresponses;  #기존의 db가 있으면 삭제
	CREATE DATABASE formresponses;  #db 생성
	USE formresponses;  #db 사용
	CREATE TABLE response1 (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
		firstname VARCHAR(20), lastname VARCHAR(20), 
		email VARCHAR(50), submitdate DATETIME);
	CREATE TABLE response2 (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
		firstname VARCHAR(20), lastname VARCHAR(20), 
		email VARCHAR(50), submitdate DATETIME);"
sudo service mysql restart

echo cd / >> /home/vagrant/.bashrc
echo "Hello World from DBBox!"