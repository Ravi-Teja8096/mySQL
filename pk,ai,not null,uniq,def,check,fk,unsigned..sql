use aa_db
set autocommit=0;
 select * from twg_employees;
 insert into twg_employees values(5 ,'wmy','wmy@gmail.com ','2020-11-25');
  insert into twg_employees values(6 ,'rtc','rtc@gmail.com ','2021-9-26');
  delete from twg_employees where id>4;
   select * from twg_employees;
    delete from twg_employees where id=3;
    select * from twg_employees;
    delete from twg_employees where id is null;
    select * from twg_employees;
    update twg_employees set joindate = '2025-12-11'where id=4
    select * from twg_employees;
    insert into twg_employees values (3, 'rtc', 'rtc@gmail.com','2020-02-13');
	select * from twg_employees;
    select * from twg_employees order by id desc;
    select * from twg_employees order by empname;
	select * from twg_employees order by joindate;
    --Primary Key
    create table students (id int primary key ,name varchar(50),age int);
     insert into students(id, name,age)
values(1,"ravi",30);  
 insert into students(id, name,age)
values(2,"raju",20);
insert into students values (3,"jay",15);
select * from students;
--Auto Increment
create table orders(id int primary key auto_increment,product_name varchar(50));
insert into orders(product_name) values('laptop','mobile','tv');
select * from orders;
create table product(id int primary key auto_increment,name varchar(50));
insert into product(name) values('laptop','mobile','tv');
select * from orders;
 create table subjects (
 id int primary key auto_increment,name varchar(50)
 );
 insert into subjects(name)
 values('maths');
 insert into subjects(name)
 values('social');
 select * from subjects;
 --Not Null
 create table departments(
 dep_id int primary key,
 dep_name varchar(50) not null,
 dep_salary int
  );
  insert into departments(dep_id,dep_name,dep_salary)
  values(101,'it',50000);
  insert into departments(dep_id,dep_name,dep_salary)
  values(102,'core',50000);
  select * from departments;
  ---Unique
create table emp(
id int primary key,name varchar(50),email varchar(50)unique 
);
insert into emp(id,name,email)
values(1,'ravi','ravi@gmail.com');
insert into emp(id,name,email)
values(2,'tejs','ravi@gmail.com');
----Default
create table products( products_id int primary key,name varchar(50),status varchar(50) default 'available'
);
insert into products(products_id, name)
values(101,'laptop');
---check
create table accounts(
acc_id int primary key ,balance int check (balance>=0)
);
insert into accounts(acc_id,balance)
values(1,100);
Select * from accounts
---Foreign Key
create table deperment(
dept_id int primary key,dept_name varchar(50)
);
create table staff(
staff_id int primary key,
dept_id int,
foreign key (dept_id) references department(dept_id)
);
insert into depertment(dept_id,dept_name)
values(101,'HR'),(102,'Test');
insert into staff(staff_id,dept_id)
values(1,101),(2,102);
select * from depertment;
use bb_db
--display current database
select database();
create table deparment(
dept_id int primary key,dept_name varchar(50)
);
create table staff (
staff_id int primary key,
dept_id int,
foreign key (dept_id) references deparment(dept_id)
);
insert into deparment(dept_id,dept_name)
values(101,'HR'),(102,'Test');
insert into staff(staff_id,dept_id)
values(1,101),(2,102);
select * from deparment;
--UNSIGNED
create table inventory(
item_id int primary key,
quantity int unsigned
);
insert into inventory(item_id,quantity)
values(1,10);
insert into inventory(item_id,quantity)
values(2,-5);
select * from inventory;



   
    
