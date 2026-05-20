USE te_db;
select database();
Show tables;
select * from students;
--remove columns
alter table students drop column fee; 
---alter (modify column)
alter table  students modify column fee decimal(8,2);
--rename table columns
alter table students rename column course to domain;
select * from students;
Show tables;
--rename  table
alter table students rename to te_students; 
select * from students;
--drop table
drop table employees; 
desc te_students
--truncate table
truncate table te_students;
Select * from te_students;

