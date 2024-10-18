with
    stateprovince as (
        select stateprovince_id
        , stateprovince_code
        , countryregion_code
        , name as state_name
        from {{ ref('stg_erp__stateprovince') }}
    ),

    country as (
        select countryregion_code
        , country_name
        from {{ ref('stg_erp__countryregion') }}
    ),

    address as (
        select
        address.address_id
        , address.stateprovince_id
        , address.address_line
        , address.postal_code
        , address.city as city_name
        , country.country_name
        from {{ ref('stg_erp__address') }} as address
        left join stateprovince on address.stateprovince_id = stateprovince.stateprovince_id
        left join country on stateprovince.countryregion_code = country.countryregion_code
    )

select *
from address
