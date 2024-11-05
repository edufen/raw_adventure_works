with
    creditcard as (
        select
        row_number () over (order by creditcard_id) as creditcard_sk  
        , creditcard_id
        , card_number
        , card_type
        from {{ ref('stg_erp__creditcard') }}
    )

select * from creditcard 