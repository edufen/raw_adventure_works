with
    salesreason as (
        select
        salesreason_id
        , name
        , reason_type
        from {{ ref('stg_erp__salesreason') }}
    )

    , salesreasonheader as (
        select
        salesorder_id
        , salesreason_id
        from {{ ref('stg_erp__salesorderheadersalesreason') }}
    )

    , joined as (
        select
        row_number () over (order by salesreason.salesreason_id) as salesreason_sk
        , salesreason.salesreason_id
        , salesreasonheader.salesorder_id
        , salesreason.name
        , salesreason.reason_type
        from salesreason
        left join salesreasonheader on salesreason.salesreason_id = salesreasonheader.salesreason_id
    )

select * from joined

