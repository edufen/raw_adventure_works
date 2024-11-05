/*
    This test will check that the data from 2011 matches the records the company documented for that year.
    $12.646.112,16
*/

with
    sales_in_2011 as (
        select SUM(subtotal) as total_sales
        from {{ ref('FCT_ORDERS') }}
        where order_date like '2011%'
    )

select total_sales
from sales_in_2011
where total_sales not between 12646112.10 and 12646112.20 