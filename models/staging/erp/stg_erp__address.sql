with source as (
    select distinct
        addressid as address_id
        , stateprovinceid as stateprovince_id
        , addressline1 as adress_line
        , postalcode as postal_code
        , city
        , rowguid
        , CAST(modifieddate as DATETIME) as modified_date
    from {{source('AdventureWorks','address')}}
)
select *
from source