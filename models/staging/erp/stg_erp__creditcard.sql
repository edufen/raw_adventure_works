with source as (
    select distinct
        creditcardid as creditcard_id
        , cardtype as card_type
        , cardnumber as card_number
        , expyear as exp_year
        , expmonth as exp_month
        , CAST(modifieddate as DATETIME) as modified_date
    from {{ source('AdventureWorks','creditcard')}}
)

select * from source