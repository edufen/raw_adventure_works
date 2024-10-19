with source as (
    select
        territoryid as territory_id
        , businessentityid as businessentity_id
    from {{ source('AdventureWorks','salesterritoryhistory')}}
)

select * from source