with source as (
    select distinct
        stateprovinceid as stateprovince_id
        , territoryid as territory_id
        , stateprovincecode as stateprovince_code
        , name
        , isonlystateprovinceflag as onlystateprovince_flag
        , countryregioncode as countryregion_code
        , CAST(modifieddate as DATETIME) as datetime
        , rowguid
    from {{source('AdventureWorks','stateprovince')}}
)
select *
from source