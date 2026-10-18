create database sales;
use sales;
create table customers(
customer_id int primary key,
name varchar(30),
city varchar(30)
);
create table orders(
order_id int primary key,
customer_id int,
amount int
);
insert into customers
(customer_id,name,city)
values
(1,"Alice","Mumbai"),
(2,"Bob","Delhi"),
(3,"Charlie","Bangalore"),
(4,"David","Mumbai");
insert into orders
(order_id,customer_id,amount)
values
(101,1,500),
(102,1,900),
(103,2,300),
(104,5,700);
select * from customers;
select * from orders;

-- inner join
select *
from customers c
inner join orders o
on c.customer_id=o.customer_id;

-- left join
select *
from customers c
left join orders o
on c.customer_id=o.customer_id;

-- right join
select *
from customers c
right join orders o
on c.customer_id=o.customer_id;

-- outer join i.e., union:unique values
select *
from customers c
left join orders o
on c.customer_id=o.customer_id
union
select *
from customers c
right join orders o
on c.customer_id=o.customer_id;
-- cross join
select *
from customers c
cross join orders o;
-- left exclusive join
select *
from customers c
left join orders o
on c.customer_id=o.customer_id
where o.customer_id is null;
-- right exclusive join
select *
from customers c
right join orders o
on c.customer_id=o.customer_id
where c.customer_id is null;

-- subqueries
	-- in orders table,select those amount whose average of amounts is less
select *
from orders
where amount>(
select avg(amount)
from orders
);
	-- with select
select name,(
	select count(*)
    from orders o
    where o.customer_id=c.customer_id
)as order_count
from customers c;
-- ---------------------------------------------------------------------------------------
-- Views in SQL
-- A view is a virtual a table based on the result-set of an SQL statement.
-- A view always shows up-to-date data.
create view view1 as
select customer_id,name from customers;

select * from view1;

create view view2 as
select c.customer_id,c.name,o.order_id
from customers c
inner join orders o
on c.customer_id=o.customer_id;

select * from view2;
-- ---------------------------------------------------------------------------------------
-- Understanding Index
create table accounts(
accounts_id int primary key auto_increment,
name varchar(50),
balance decimal(10,2),
branch varchar(50)
);
insert into accounts
(name,balance,branch)
value
("Adam",500.00,"Mumbai"),
("Bob",300.00,"Delhi"),
("Eve",1000.00,"Bangalore"),
("David",1000.00,"Noida");
select * from accounts;
create index idx_branch on accounts(branch);
show index from accounts;
-- ---------------------------------------------------------------------------------------
-- stored procedures
-- lets create a stored procedures jo kisi user ka account_id k basis par user ka balance return karta hai
-- a delimiter tells MySQL where a SQL statement ends. By default, the delimiter is a semicolon (;).
-- The main reason we change it is when creating stored procedures, functions, and triggers that contain multiple SQL statements.
delimiter $$
create procedure check_balance(in acc_id int)
begin
	select balance
    from accounts
    where accounts_id=acc_id;
end $$
delimiter ;
-- calling the procedure
call check_balance(1);
call check_balance(2);