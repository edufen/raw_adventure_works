with source as (
    select distinct
        customerid as customer_id
        , personid as person_id
        , territoryid as territory_id
        , storeid as store_id
        , rowguid	
        , CAST(modifieddate as DATETIME) as modified_date
    from {{ source('AdventureWorks','customer')}}
)

select * from source 