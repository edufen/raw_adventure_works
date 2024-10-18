with source as (
    select distinct
        countryregioncode as countryregion_code
        , name
        , CAST(modifieddate as DATETIME) as modified_date
    from {{source('AdventureWorks','countryregion')}}
)
select *
from source