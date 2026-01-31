select * from hr;
-- 1.	Calculate the attrition rate (%) for each age group and rank age groups 
-- by highest attrition.
select agegroup, round(sum(if(attrition='yes',1,0)) / 
		count(*) * 100,2)  as attrition
from hr
group by agegroup 
order by attrition desc;


2.	Identify the average monthly income by gender and department, and highlight income gaps.
3.	Find the most common education field among employees who left the company.
4.	Determine which marital status group has the highest attrition count.
5.	Rank departments by average total working years of employees.
