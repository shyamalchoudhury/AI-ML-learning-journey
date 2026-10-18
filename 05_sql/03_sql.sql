-- Transactions:Series of Operation that is seen as whole.
-- ACID properties
-- Atomicity:All Statement succeed or none succeed.
-- Consistency:Data moves from one valid state to another.
-- Isolation:Parallel transaction dont interfere.
-- Durability:Committed data is permanently saved.
create database if not exists prime;
use prime;
create table accounts(
id int primary key auto_increment,
name varchar(50),
balance decimal(10,2)
);
insert into accounts
(name,balance)
value
("Adam",500.00),
("Bob",300.00),
("Eve",1000.00);
select * from accounts;

select @@autocommit;
-- To work with transaction,disable autocommit
-- Disable autocommit
set autocommit = 0;
-- Enable autocomit
set autocommit=1;

-- create transaction
start transaction;
update accounts
set balance=balance-50
where id=1;
update accounts
set balance=balance+50
where id=2;
commit;

-- rollback:uncommitted changes undo
start transaction;
update accounts
set balance=balance-50
where id=1;
update accounts
set balance=balance+50
where id=3;
rollback;

-- savepoint:
start transaction;
update accounts
set balance=balance+1000
where id=1;
savepoint after_wallet_topup;
update accounts
set balance=balance+10
where id=1;
-- error
rollback to after_wallet_topup;
commit;
-- ---------------------------------------------------------------------

