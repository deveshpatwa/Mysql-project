SELECT * FROM db1.store;

select * from store
limit 0;

select category, round(sum(sale),2)
from store 
group by category;

# category wise top selling sun-category with there sales

select category, sum(sale)
from store
group by category;

select * 
from store
limit 0;

select distinct region ,sum(sale)
from store
where category = 'furniture'
group by region;

select * from store;

select sum(case when sale>=1000 then sale else 0 end) as total_max_sales
from store

union
select sum(sale) as "total sales"
from store;select * from sys;

-- creating databases and removing  it

create database new;

show databases;

drop database new;

use db1;

show table status;

show tables;

select * from store;

select city from store;

select distinct city from store;
-- number of unique cities
select count(distinct city )
from store;

-- city wise average prifit in desc order

select city , round(avg(profit)) as avgp
from store
group by city
order by avgp desc;

select * from store;
-- find 2nd most profitable customer

select name, sum(profit) as total_profit
from store
group by name
order by total_profit desc
limit 1 
offset 1 ;
alter



-- selecting even id from data

select id from store;

select id 
from store 
where mod(id,2) = 0;


-- find sales which are above average profit

SELECT id, profit
FROM store
WHERE profit >= (	SELECT AVG(profit)
				FROM store);

-- you can check this is the average profit
select avg(profit) from store;


-- find total sales of furniture category
 -- with where
select category, sum(sale)
from store
where category = 'furniture'
group by category;

-- using having

select category , sum(sale)
from store
group by category 
having category = 'furniture';


select * from store;

select order_date,sale
from store;

-- percent change per year
create table sale_year as
select year(order_date) as years ,round(sum(sale)) as total_sales
from store
group by year(order_date);

select * from sale_year;


select * from store;
describe store;

alter table store
modify column order_date date;

update store
set order_date=str_to_date(order_date,'%m/%d/%Y');

select * from store;

desc store;



-- now i have a new table year with total sales

with a as (
select * from sale_year
order by year asc)
select lead(total_sales) ,	total_sales
from a;

select lead(years)
from sale_year;


-- find the percent change in total sales in each year

with a as (
select * from sale_year
order by years asc)
select years,total_sales ,round(((total_sales - lag(total_sales,1,null) over())/total_sales)*100,2) as chg_in_percent from a;


-- top 3 highest profitable city in each category 

with ranked_data as (
select category , city ,round(sum(profit)) as total_profit , row_number() over(partition by category order by sum(profit) desc ) as rankk
from store
group by category, city)
select category,city,total_profit
from ranked_data
where rankk <=3;

select * from store
limit 0 ;

-- Find the total sales and total profit for each category and sub_category combination.
create view category_wise_sales as(
select category , sub_category , sum(sale)
from store 
group by category,sub_category
order by category,sum(sale) desc);

select * from category_wise_sales;

-- 2 List the top 5 cities with the highest total sales.

select city ,sum(sale) as total_sales
from store
group by city
limit 5;

select * from store limit 0;
-- Find the number of unique customers in each region.

select distinct  region , count(customer_id )  # my way which was wrong
from store 
group by region;

select region , count(distinct customer_id)  -- right way to do it
from store
group by region;

-- 4 Calculate average profit per order for each shipment type.
select shipment,round(avg(profit),2) as average_profit
from store
group by shipment
order by average_profit desc;

-- 5 Retrieve all orders where profit is negative.

select * from store 
where profit <0;

-- 6 Get total sales, quantity sold, and average sale per item for each sub_category.
select sub_category, round(sum(sale)) as total_sales, sum(qty) as total_qty , round(avg(sale)) as average_sales
from store
group by sub_category;


-- 7 List the top 3 states in each region by total profit.
with ranked_state as (
select region, state, round(sum(profit)) as total_profit, row_number() over(partition by region order by sum(profit) desc) as rankk
from store 
group by region, state)
select * from ranked_state
where rankk <=3;

-- 8 Find the month and year with the highest total sales.
select left(order_date,7) as month_year , sum(sale) as totalo_sales
from store
group by month_year
limit 1;

-- 9 Count how many orders were placed for each shipment type in each region.
select shipment, region,count(*)
from store
group by shipment,region
order by shipment,count(*) desc;

-- 10 Get the top 5 customers by total profit.
select name ,round(sum(profit)) as total_profit
from store
group by name
order by total_profit desc
limit 5;

-- date format
select date_format(order_date,'%M, %Y')
FROM store;


SELECT DISTINCT category,sub_category 
FROM store
ORDER BY category;

SELECT COUNT(DISTINCT sale)
FROM store;

SELECT * 
FROM store  
WHERE sale BETWEEN 200 AND 300;

SELECT profit
FROM store
WHERE profit < 0;

select category 
from store
where category like "t%";

select name 
from store 
where name like "a%";

select name 
from store 
where name like "%sh";

select name 
from store 
where name like "AA";

select trim(left(name,locate(" ",name)-1)) as first_name , length(left(name,locate(" ",name)))
from store
where left(name,locate(" ",name)-1) like "%n";
with a as (
select trim(left(name,locate(" ",name)-1)) as fname
from store)
select fname from a
where fname like "%n";


select * from store 
where qty in (0,1,2,3,4);


select * 
from store
where category = "furniture"
and profit < 0;

select name
from store 
where post_code is null;

select * from store;

select category ,round(sum(profit)),round(min(profit)),round(sum(profit)),round(avg(profit))
from store
group by category;





SELECT *
FROM store
WHERE sale >= 200;


-- Create the table
CREATE TABLE class (
    id INT,
    skill VARCHAR(50)
);

-- Insert data into the table
INSERT INTO class (id, skill) VALUES
(101, 'SQL'),
(102, 'SQL'),
(102, 'Python'),
(102, 'Excel'),
(103, 'SQL'),
(103, 'Excel'),
(104, 'Python'),
(104, 'Excel'),
(105, 'SQL'),
(106, 'Python'),
(106, 'SQL');

-- Query to select associates competent in only 'SQL' and 'Python'
-- SELECT associate_id 
-- FROM associates
-- GROUP BY associate_id
-- HAVING COUNT(DISTINCT skills) = 2
--    AND SUM(skills NOT IN ('SQL', 'Python')) = 0;

select * from class;
with temp as (
select id,group_concat(skill order by skill asc) as gs
from class
group by id
having gs="Python,SQL"
)
select id from temp;

select * from store;
where category = 'furniture';


create database db2;

use db2;

create table emp(
	id int primary key auto_increment,
    name varchar(30),
    salary double
);

select * from emp;

describe emp;

alter table emp
add column name2 varchar(5);

select * from emp;


insert into emp(name,salary)
values ("ravi",50000);

