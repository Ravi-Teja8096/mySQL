use aa_db;
select database();
desc twg_employees;
select * from twg_employees;
desc twg_employees;
delete from twg_employees where id>3;
update twg_employees set email='pqr@gmail.com'where empname ='pqr';
set sql_safe_updates=0;
select * from twg_employees;
insert into twg_employees(id,empname) values(4,'pqr');
update twg_employees set email='pqr@gmail.com'where id=4;
insert into twg_employees() values();
select * from twg_employees;
create table twg_employees3(id int NOT NULL,empname varchar(200) NOT NULL,email varchar(100),joindate date);
desc twg_employees3 
insert into twg_employees3() values();
insert into twg_employees3(id,empname)values(1,'abc');
select * from twg_employees3;
select * from twg_employees;
select id,empname,email from twg_employees;
select id,empname,email from twg_employees where id>1;
select id,empname,email from twg_employees;
select id,empname,email from twg_employees limit 1;
select id,empname,email from twg_employees limit 2;


