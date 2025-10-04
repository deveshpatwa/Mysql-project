show tables;
select * from orders;

describe orders;

select count(*)
from orders;

select category, (sales / sum(sales) over()) * 100
from orders;


with t1 as (
select sub_category, sum(sales) as sales
from orders
group by sub_category)
select sub_category,round( (sales/ sum(sales) over())*100 ,2) as sales_per
from t1
order by sales_per desc;



select * from store;


select distinct customer_id
from store
where  customer_id regexp "\t";


create table reg(txt varchar(30));

select * from reg;

insert into reg values("123-444-456"),("232.232.232");

select * category_wise_sales
from reg
where txt regexp "\d\d\d[.]\d\d\d[.]\d\d\d";

drop table checkint;

create table checkint(
	name enum("ravi","kunal"));
    
describe checkint;

insert into checkint values("ravi");

select * from checkint;
insert into checkint values("kunal");


create table emp(
	dob datetime);
    
insert into emp values("2025-8-27 3:20:0");

select * from emp;
describe emp;
drop table emp;

alter table emp
add column address varchar(30);

alter table emp
modify column name int;

describe emp;
alter table emp
modify column name date;

alter table emp
drop column name;

alter table emp
rename to newemp;

describe newemp;