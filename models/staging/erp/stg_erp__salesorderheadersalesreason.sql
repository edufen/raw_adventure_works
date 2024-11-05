with source as (
    select
    salesorderid as salesorder_id
    , salesreasonid as salesreason_id
    , ROW_NUMBER() OVER (PARTITION BY salesorder_id ORDER BY salesreason_id) as rowN
    , CAST(modifieddate as DATETIME) as modified_date
    from {{ source('AdventureWorks','salesorderheadersalesreason')}}
)

select *
from source
where rowN = 1
order by salesorder_id 