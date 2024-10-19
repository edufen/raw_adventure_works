with source as (
    select distinct
        currencyrateid as currencyrate_id
        , fromcurrencycode as from_currency_code
        , tocurrencycode as to_currency_code
        , CAST(currencyratedate as DATETIME) as currencyrate_date
        , averagerate as average_rate
        , endofdayrate as endofday_rate
    from {{ source('AdventureWorks','currencyrate')}}
)
select *
from source