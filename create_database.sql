drop database if exists `muller_db2`;
create database `muller_db2`;
use `muller_db2`;

create table Employee(ID int, Name varchar(20), Salary int, Manager int, Department varchar(20)); 
create table Course(EmpID int, CourseID int, Prof varchar(20), Grade int);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/emp_database'
INTO TABLE Employee FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n' (ID, Name, Salary, Manager, Department);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/course_database'
INTO TABLE Course FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n' (EmpID, CourseID, Prof, Grade);