with
    product as (
        select
        row_number () over (order by product_id) as product_sk
        , product_id
        , productsubcategory_id
        , product_name
        , product_number
        , list_price
        , standard_cost
        from {{ ref('stg_erp__product') }}
    )

select * from product 