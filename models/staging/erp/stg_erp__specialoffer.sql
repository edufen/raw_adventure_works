with source as (
    select distinct
        specialofferid as specialoffer_id
        , type
        , category
        , discountpct as discount_pct
        , CAST(startdate as DATETIME) as start_date
        , CAST(enddate as DATETIME) as end_date
        , minqty as min_quantity
        , maxqty as max_quantity
        , description
        , CAST(modifieddate as DATETIME) as modified_date
        , rowguid
    from {{ source('AdventureWorks','specialoffer')}}
)

select * from source 