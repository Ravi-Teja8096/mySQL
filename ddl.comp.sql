create database bb_db;
show databases;
USE bb_db;
--Display current database;
select database();
create table employees (id INT,ename VARCHAR(200),desg VARCHAR(50),joindate Date);
Show tables;
desc employees;
drop table employees;
drop database bb_db;
Create database aa_db;
Use aa_db;
Show database();
Select database();
create table employees (id INT,ename VARCHAR(200),desg VARCHAR(50),joindate Date);
insert into employees values (1,'abc','manager','2025-03-20');
insert into employees values (2,'def','developer','2024-06-12');
insert into employees values (3,'xyz','tester','2025-07-28');
commit;
Select * from employees;
truncate table employees;
Select * from employees;
create table employees (id INT,ename VARCHAR(200),desg VARCHAR(50),joindate Date);
insert into employees values (1,'abc','manager','2025-03-20');
insert into employees values (2,'def','developer','2024-06-12');
insert into employees values (3,'xyz','tester','2025-07-28');
commit;
alter table employees add column email Varchar(100) after ename; 
desc employees;
alter table employees rename column ename to empname; 
desc employees;
alter table employees drop column desg;
desc employees;
rename  table employees to twg_employees;
Show tables;
desc twg_employees;





