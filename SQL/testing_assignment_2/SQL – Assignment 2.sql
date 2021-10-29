CREATE DATABASE  testing_system_2;
USE testing_system_2;

#table department

CREATE TABLE   department  (
department_id INT AUTO_INCREMENT,
department_Name VARCHAR (50) NOT NULL,
PRIMARY KEY (department_id)
);
INSERT INTO department (department_id,department_Name) VALUES (1,'lammoicoan');

#table positson

create table `position_1` (
positionID  TINYINT UNIQUE KEY AUTO_INCREMENT,
Position_Name VARCHAR(50) NOT NULL

);
INSERT INTO position_1 (positionID,Position_Name) VALUES (1,'TRANVANSON');

#table account

CREATE TABLE `account` (
AccountID  TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Email VARCHAR (50) NOT NULL,
Username CHAR(30) UNIQUE,
Full_Name VARCHAR(50) DEFAULT 'SON',
Department_ID TINYINT,
Position_ID TINYINT,
CreateDate DATETIME default now()
 );
 
 ALTER TABLE `account` CONSTRAINT lien_ket_01 FOREIGN KEY (AccountID) REFERENCES department(department_id)


#table roupAccount

create Table   GroupAccount (
GroupID TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
AccountID INT NOT NULL,
JoinDate DATETIME default NOW() 
);
insert into GroupAccount(GroupID,AccountID) values (11,222);




#table TypeQuestion

CREATE TABLE Type_Question (
Type_ID TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
type_Name CHAR(30));
ALTER TABLE Type_Question ADD type_date DATE;

 #table 7
 
create Table Category_Question (
Category_ID  INT primary key  auto_increment,
Category_Name CHAR(100) NOT NULL UNIQUE
);

#tabale 8

CREATE TABLE  Question (
QuestionID INT PRIMARY KEY AUTO_INCREMENT,
Content VARCHAR(100) NOT NULL,
Category_ID INT NOT NULL UNIQUE,
TypeID INT unique,
reatorID INT,
CreateDate DATETIME default now()
);
INSERT  INTO Question ( QuestionID,Content ) value (1,'SON');


#table 9

CREATE TABLE answer (
AnswerID INT PRIMARY KEY  auto_increment,
Content varchar(50),
QuestionID INT UNIQUE,
isCorrect varchar(50)
);
INSERT INTO answer (AnswerID,QuestionID) VALUES ('HOI','TRA_LOI');


## table 10

CREATE TABLE  Exam (
ExamID INT AUTO_INCREMENT PRIMARY KEY,
Title CHAR(50) ,
CategoryID INT NOT NULL,
Duration  VARCHAR(50) ,
CreatorID INT UNIQUE,
CreateDate DATE TIME 
);

ENUM Title { KHONG, BIET, GI};

#table 11

 create Table ExamQuestion11 (
ExamID INT primary key  auto_increment,
QuestionID varchar(100)
);
