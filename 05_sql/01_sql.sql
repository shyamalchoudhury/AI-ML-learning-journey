create database if not exists college;
use college;
create table student(
rollno int primary key,
name varchar(30) not null,
age int constraint check(age>=18),
t_id int,
foreign key (t_id) references teacher(Id)
);
insert into student
(rollno,name,age,t_id)
values
(101,"Shyamal",24,1),
(102,"Shivam",26,2),
(103,"Soubam",23,4),
(104,"Bikash",18,3);

insert into student
(rollno,name,age,t_id)
values
(105,"Sanaya",28,5),
(106,"Sindhya",20,6),
(107,"Senahani",21,8),
(108,"Senimai",30,7);

create table teacher(
Id int primary key,
name varchar(30) not null,
email varchar(50) unique,
Followers int default 0,
Following int,
age int
);
drop table student,teacher;
insert into teacher
(Id,name,email,Followers,Following,age)
values
(1,"Adam","adam@yahoo.in",201,145,40),
(2,"Bob","bob123@gmail.com",200,200,41),
(3,"Casey","casey@gmail.com",300,306,40),
(4,"Donald","donald@gmail.com",200,105,43);

insert into teacher
(Id,name,email,Followers,Following,age)
values
(5,"Heron","heron@gmail.com",1000,100,45),
(6,"Rahul","rahul@gmail.com",10000,15,50),
(7,"David","davidd@gmail.com",240,1100,50),
(8,"Eve","eve@gmail.com",2000,205,41);

insert into teacher
(Id,name,email,Followers,Following,age)
values
(9,"Shouria","shouria@gmail.com",10000,2000,49);

delete from teacher
where name="Shouria";

update teacher
set following=250
where age=50;
set sql_safe_updates=0;

alter table teacher
add column city varchar(30) default "Delhi";

alter table teacher
add column Country varchar(30) default "Assam";

alter table teacher
rename column Id to Identity;

alter table teacher
drop column Country;

select * from teacher;

select age,count(age)
from teacher
group by(age);
select age,max(Followers) 
from teacher
group by(age);
select * from student
where age>20
ORDER BY rollno Desc;


