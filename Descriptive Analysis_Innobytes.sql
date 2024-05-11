show databases;
use innobytes;
show tables;
select * from samplesuperstore;
Select * From samplesuperstore
order by profit asc
LIMIT 1;                            # min profit

Select * from samplesuperstore
order by profit desc
limit 1;                            #max profit


select count(sales) as total_sales_count
from samplesuperstore;              #count of sale 

select avg(sales) as average_sales 
from samplesuperstore;             #average sales

select * from samplesuperstore
order by sales desc
limit 1;                            # max sale

select * from samplesuperstore
order by sales asc
limit 1;                            #min sales

SELECT
    AVG(median_value) AS median
FROM (
    SELECT
        sales AS median_value,
        ROW_NUMBER() OVER (ORDER BY sales) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM
        samplesuperstore
) AS sub
WHERE
    row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);      #median sales

with samplesuperstore as ( 
    select 
        sales, 
        NTILE(4) over (order by sales) as Quartile 
    from 
        samplesuperstore
) 
select 
    max(case when Quartile = 1 then sales end) as Q1, 
    max(case when Quartile = 3 then sales end) as Q3 
from
    samplesuperstore 
group by 
    Quartile;                                           #calculating 1st and 3rd quartile

select * from samplesuperstore
order by quantity asc
limit 1;                            # min quantity sold

select * from samplesuperstore
order by quantity asc
limit 1;                            # max quantity sold

select avg(quantity) as average_quantity
from samplesuperstore;              #avaerage quantity sold







