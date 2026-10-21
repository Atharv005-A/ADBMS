create database User;

use User;

create table customer
(
Custid int,
Custname varchar(15),
City varchar(10),
Product varchar(15),
Price int
);


alter table customer
add primary key (Custid);

insert into customer values (1,'Atharv','Sangli','Mobile',45000),
(2,'prithvi','kolhapur','laptop',60000),
(3,'abhi','latur','ipad',80000);

select Custname ,product from customer;

create table cloneCustomer as select * from customer;
select * from cloneCustomer;

select * from customer;			

drop table cloneCustomer;	

select Custname ,City from customer;

select Custname, City from customer where Custid=1;

select Custname,Product,Price from customer where price > 15000;
select Custname,Product,Price from customer where price < 15000;
select * from customer where price>15000;
select * from customer where Custid=1;
select * from customer where City='Sangli';

select * from customer order by price;
select * from customer order by price desc;

select * from customer order by Custid;
select * from customer order by Custid desc;

select * from  customer order by City asc;

select * from customer order by City ,Price;
select * from customer order by Price,City;

select * from customer order by City desc ,Price asc;

select upper(Custname),lower(Product) from customer
where Custid<3;

alter table customer
add column lname varchar(15);
desc customer;

update customer set lname='Pawar' where Custid=1;
update customer set lname='Patil' where Custid=2;
update customer set lname='Dhokade' where Custid=3;

select concat(Custname,lname)from customer;
select concat(Custname,' ',lname)as  fullname from customer;

select * from customer;
select substr(Custname,2,2) from customer;


select instr(Custname,'a')as postion from customer;


select substr(custname,1,3),instr(custname,'a')
from customer where custid<3;

-- date and time

select now();
 
 select now() as current_datetime;
 
 
 
 alter table customer add column date date;
 

 update customer
 set date="2026/10/04";
 
 set sql_safe_updates=0;
 
 select* from customer;
 
 --
 
 
 alter table customer
 drop date;
 
 
