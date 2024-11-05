with source as (
    select distinct
        currencycode as currency_code
        , name
        , CAST(modifieddate as DATETIME) as modified_date
    from {{ source('AdventureWorks','currency')}}
)

select * from source 