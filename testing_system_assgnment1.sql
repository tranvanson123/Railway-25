create database testing_system1;
use testing_system1;
table department;

#table department
create table  department  (
department_id int auto_increment,
departmentName varchar (100),
primary key (department)
);
#table positson
create table position_1 (
positionID int primary key  auto_increment,
PositionName varchar(100)
);

#table account
create table account(
AccountID  int primary key auto_increment,
Email varchar(50),
Username varchar(50),
FullName varchar(50),
DepartmentID varchar(50),
PositionID varchar(50),
CreateDate date );

#table roupAccount
create Table   GroupAccount1 (
GroupID varchar (50),
AccountID varchar (50),
JoinDate date );

#table TypeQuestion
create Table TypeQuestion (
TypeID INT primary key  auto_increment,
typeName varchar(50));

 #table 7
create Table 7CategoryQuestion(
CategoryID INT primary key  auto_increment,
CategoryName varchar(300)
);
#tabale 8
create Table Question1(
QuestionID INT primary key  auto_increment,
Content varchar(100),
CategoryID varchar(50),
TypeID varchar(50),
reatorID varchar(50),
CreateDate date
);
#table 9
create table answer1(
AnswerID INT primary key  auto_increment,
Content varchar(50),
QuestionID varchar(50),
isCorrect varchar(50)
);

## table 10
create table Exam(
ExamID INT primary key  auto_increment,
Code varchar(50),
Title varchar(50),
CategoryID int,
Duration varchar(50),
CreatorID int,
CreateDate date);

#table 11
 create Table ExamQuestion11 (
ExamID INT primary key  auto_increment,
QuestionID varchar(100)
);
