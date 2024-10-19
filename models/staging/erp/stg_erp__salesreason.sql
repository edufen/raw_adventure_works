with source as (
    select distinct
        salesreasonid as salesreason_id
        , name 
        , reasontype as reason_type
    from {{ source('AdventureWorks','salesreason')}}
)

select * from source