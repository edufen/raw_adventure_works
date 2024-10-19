with source as (
    select distinct
        countryregioncode as countryregion_code
        , name as country_name
        , CAST(modifieddate as DATETIME) as modified_date
    from {{ source('AdventureWorks','countryregion')}}
)
select *
from source