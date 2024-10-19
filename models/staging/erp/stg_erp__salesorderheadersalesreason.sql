with source as (
    select
    salesorderid as salesorder_id
    , salesreasonid as salesreason_id
    , CAST(modifieddate as DATETIME) as modified_date
    from {{ source('AdventureWorks','salesorderheadersalesreason')}}
)

select * from source