with T as (select *,dense_rank() over(order by salary desc) as rnk from Employee )

select
case when (select count(1) from T) > 1 then
(select distinct salary as secondHighestSalary from T where rnk=2)
else
NULL end as secondHighestSalary ;