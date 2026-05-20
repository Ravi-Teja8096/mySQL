Use te_db;
Select database();

--insert signal row into the table
insert into students(id,name,course,fee)
values(1, 'Ravi','Python',5000);
--select | read the table
select * from students;