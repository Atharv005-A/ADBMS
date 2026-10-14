create database tcl;
use tcl;
create table orders(order_id int primary key, customer_name varchar(50), status varchar(50));

desc orders;

set autocommit = 0;

begin;

insert into orders values(101, "Geet", "Pending");
insert into orders values(102, "Bob", "Pending");
truncate table orders;
select * from orders;

commit;


update orders set customer_name='Raj' where order_id=102;


insert into orders values(103, "atharv", "Approved"),(104, "prithvi", "Pending");
savepoint sp1;

delete from orders where order_id=102;
savepoint sp2;

rollback to savepoint sp1;

select * from orders;



