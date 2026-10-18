create database if not exists Clg;
use Clg;
create table faculty(
id int primary key,
name varchar(30),
subject varchar(30),
salary int
);
create table Stdnt(
roll_no int primary key,
name varchar(30),
city varchar(30),
marks int
);

insert into faculty
(id,name,subject,salary)
values
(23,"ajay","math",50000),
(47,"bharat","english",60000),
(18,"chetan","chemistry",45000),
(9,"divya","physics",75000);

insert into Stdnt
(roll_no,name,city,marks)
values
(110,"adam","Delhi",76),
(108,"bob","Mumbai",65),
(124,"casey","Pune",94),
(112,"duke","Pune",80);
select * from faculty;
select * from Stdnt;
-- select teacher whose salary is more than 55k
select * from faculty
where salary>55000;
-- rename the salary column of teacher table to ctc
alter table faculty
rename column salary to ctc;
-- Update the salary of all teachers by giving them an increment of 25%
alter table faculty
add column increment float default 0.25;
update faculty
set ctc=ctc-increment*ctc;
set sql_safe_updates=0;
-- Add a new column for teacher called city.The default city should be "Gurgaon"
alter table faculty
add column city varchar(30) default "Gurgaon";
-- delete the salary column for teacher table
alter table faculty
drop column ctc;
-- select all student who score 75+
select * from Stdnt
where marks>75;

-- Find names of all cities where student are from
-- method1
select distinct city from Stdnt;
-- method2
select city from Stdnt group by city;

-- find the maximum marks of student from each city
select city,max(marks) from Stdnt group by city;

-- find the average of the class
select avg(marks) from Stdnt;

-- add a new column grade:assign grade such that marks>80,grade=O;marks 70-80,grade=A;marks 60-70,grade 60-70
alter table Stdnt
add column grade varchar(2);

update Stdnt
set grade="O"
where marks>=80;

update Stdnt
set grade="A"
where marks<80 and marks>=70;

update Stdnt
set grade="B"
where marks<70 and marks>=60;