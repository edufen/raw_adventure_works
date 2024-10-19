with
    stateprovince as (
        select stateprovince_id
        , stateprovince_code
        , countryregion_code
        , name as state_name
        from {{ ref('stg_erp__stateprovince') }}
    )

    , country as (
        select countryregion_code
        , country_name
        from {{ ref('stg_erp__countryregion') }}
    )

    , address as (
        select
        address_id
        , stateprovince_id
        , address_line
        , postal_code
        , city as city_name
        from {{ ref('stg_erp__address') }}
    )

    , joined as (
        select
        row_number () over (order by address_id) as address_sk
        , address.stateprovince_id
        , address.address_id
        , address.postal_code
        , country.country_name
        , stateprovince.countryregion_code
        , stateprovince.stateprovince_code
        , stateprovince.state_name
        , address.city_name
        from address
        left join stateprovince on address.stateprovince_id = stateprovince.stateprovince_id
        left join country on stateprovince.countryregion_code = country.countryregion_code
    )

select * from joined
