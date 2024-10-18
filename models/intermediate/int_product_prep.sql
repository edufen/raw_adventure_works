with
    product as (
        select
        product_id
        , productsubcategory_id
        , product_name
        from {{ ref('stg_erp__product') }}
    )

select * from product