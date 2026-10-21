/* Filterning data from table*/

create database org;
use org;

create table emp
(
empid int not null primary key,
firstname varchar(15),
lastname varchar(15),
gender char,
role varchar(15),
dept varchar(15),
managerid varchar(10)
);

insert into emp values
(1,"Atharv","Pawar",'m',"founder","it","1"),
(2,"prithvi","Patil",'m',"co-founder","it","2"),
(3,"samyak","shinde",'m',"co-founder","it","3"),
(4,"Shuruti","Pingle",'f',"co-founder","it","4"),
(5,"Abhi","dhokade",'f',"co-founder","it","5");


/* select distinct keyword*/

select distinct role from emp order by role;
select distinct firstname from emp order by empid;

/* and operator -- combines two or more condions returns 1,0 or null used for filtering data with the where clause*/

select * from emp where role="co-founder" and empid<4;
select * from emp where role="founder" and empid>1;/*null*/

/* or operator */
select * from emp where role="co-founder" or empid<4;
select * from emp where role="pani" or empid>1;

/* in operator-- is used to determine if value matches any other value in list.*/

select * from emp where role in("founder","co-founder");
select * from emp where role in("founder","pani");


/* and in operator to get value of all the columns where role is set to the required profiles*/

/* not in*/
select * from emp where role  not in("founder","co-founder");
select * from emp where role  not in("founder","pani");

/* between operator : value belongs in range*/

alter table emp add column exp int;

update emp
set exp=10
where empid=1;

update emp
set exp=5
where empid=2;

update emp
set exp=3
where empid=3;

select * from emp where exp between 3 and 10;
select * from emp where exp between 4 and 10;
select * from emp where exp=5 or exp=10;


/* like operator -- determines wheather or not a string conntains a specified pattern*/

select* from emp where firstname like 'A%';
select* from emp where firstname like '%v';

/* limit operator*/

select * from emp order by exp limit 2;


/* is null*/
select * from emp where  exp is null;

/* is not null*/
select * from emp where  exp is  not null;


/*aggregate fun*/
select count(*) from emp;

select 	count(empid) from emp where dept="it";
select min(exp)from emp;
select firstname,max(exp)from emp;
select sum(exp)from emp;
select avg(exp) as emp_exr from emp;

select firstname from emp
where exp=(select max(exp) from emp );

/* group by*/
select dept,count(*) as emp_cnt
from emp group by dept;

select role,count(*) as emp_cnt
from emp group by role;

select gender,count(*) as gender_cnt
from emp group by gender;

/* having clause-- each gorup produced by group by clause is evaluted by the having clause and if the result is true , the row is included in the result set*/
/*the having  clause was added to sql because the where keyword cannot be used with aggregate function*/

select dept,sum(exp) as t_exp
from emp group by dept 
having t_exp>=10 and t_exp<=20;

select role,sum(exp)as t_exp1
from emp group by role
having t_exp1 >=10 and t_exp1<=20;


select dept,count(empid)
from emp
group by dept
having count(empid)>2
order by count(empid) desc;