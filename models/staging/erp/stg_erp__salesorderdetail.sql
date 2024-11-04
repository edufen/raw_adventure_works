with source as (
    select
        salesorderdetailid as salesorderdetail_id
        , salesorderid as salesorder_id
        , specialofferid as specialoffer_id
        , productid as product_id
        , unitprice as unit_price   
        , orderqty as order_quantity
        , unitpricediscount as unitprice_discount
        , carriertrackingnumber as carriertrack_number
        , rowguid
        , CAST(modifieddate as DATETIME) as modified_date
    from {{ source('AdventureWorks','salesorderdetail')}}
)

select * from source