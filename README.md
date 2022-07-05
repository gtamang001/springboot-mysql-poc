# springboot-mysql-poc
## A simple springboot thymeleaf mysql project 
# Technologies used 
- Springbooot 
- Thymeleaf 
- mysql (as a container)
- Docker compose 
- maven

# How to run it locally 
## Setup project and build
```bash 
# clone the project 
git clone 
cd to project 
# run maven build 
mvn clean compile package 
```
## Setup mySql part 
```bash
# pull mysql container 
docker pull mysql/mysql-server
# run mysql container 
docker run --rm -p 3306:3306 mysql/mysql-server:latest
# keep the log as it has admin password
# you can use mysql workbech to access the mysql locally OR 
# exec into mysql container 
docker exec -it <above container-id> bash
# Once inside container run 
mysql -u root -p # use above password to login as root 
# Setup another password for root 
mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'ThePassword';
# Create database test_db 
create database test_db
# create new user for app as 'appuser'
create user 'appuser'@'%' identified by 'ThePassword';
# grant all to app user on the test databse 
grant all on test_db.* to 'appuser'@'%';
# change to test_db 
use test_db
# create table SALES * note the caps 
CREATE TABLE SALES (
  id int(11) NOT NULL AUTO_INCREMENT,
  item varchar(45) NOT NULL,
  quantity varchar(45) NOT NULL,
  amount float NOT NULL,
  PRIMARY KEY (id)
);
```
## Run your java project after build as 
```bash
# run built java jar 
java -jar target/SalesManager-0.0.1-SNAPSHOT.jar
# test your application at 
localhost:8080
```
## Keep in mind the database credentials as they need to be same for this to work !! 

# How to Run it with docker-compose
```bash
# create a Dockerfile as shown
# run 
docker build -t springboot-mysql-poc_springboot . 
# check the image built 
docker image ls 
# create a docker-compose file 
# run 
docker-compose build --no-cache
# to run the application 
docker-coompose up
```