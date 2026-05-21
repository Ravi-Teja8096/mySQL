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

----/DML
/--Insert--
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

--Insert
show databases;
show tables;
insert into twg_employees(id,empname,email,joindate)
values(1,'abc','abc@gmail.com','2026-04-24');
insert into twg_employees(id,empname,email,joindate)
values(2,'def','def@gmail.com','2026-10-12');
insert into twg_employees(id,empname,email,joindate)
values(3,'xyz','xyz@gmail.com','2023-01-02');
select * from twg_employees;
commit;
----i need same duplicate table with different name like twg_employees1--- This is process is hard & time waste.
---instead of doing copy & paste.Use (/ insert into twg_employees2 select * from twg_employees) 
show tables;
desc twg_employees;
create table twg_employees1(id int,empname varchar(200),email varchar(100),joindate date);
insert into twg_employees1(id,empname,email,joindate)
values(1,'abc','abc@gmail.com','2026-04-24');
insert into twg_employees1(id,empname,email,joindate)
values(2,'def','def@gmail.com','2026-10-12');
insert into twg_employees1(id,empname,email,joindate)
values(3,'xyz','xyz@gmail.com','2023-01-02');
commit;
select * from twg_employees1

create table twg_employees2(id int,empname varchar(200),email varchar(100),joindate date);
insert into twg_employees2 select * from twg_employees;
select * from twg_employees2

--/UPDATE----
SYNTAX:
UPDATE table_name SET column_name=new_value WHERE column_name= value { & column_name= value}
Ex: UPDATE twg_employees SET joindate = '2020-04-24' WHERE id = 1.( refer noteBook)

---/ DELETE--
SYNTAX:
DELETE FROM table_name WHERE column_name = value
EX: DELETE FROM twg_employees WHERE id > 1.









