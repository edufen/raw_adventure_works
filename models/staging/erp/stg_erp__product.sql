with source as (
    select distinct
        productid as product_id
        , productsubcategoryid as productsubcategory_id
        , name as product_name
        , class as product_class
        , productnumber as product_number
        , productline as product_line
        , listprice as list_price
        , standardcost as standard_cost
        , reorderpoint as reorder_point
        , CAST(sellstartdate as DATETIME) as sellstart_date
        , CAST(sellenddate as DATETIME) as sellen_date
        , rowguid
        , CAST(modifieddate	as DATETIME) as modified_date
    from {{source('AdventureWorks','product')}}
)
select *
from source
