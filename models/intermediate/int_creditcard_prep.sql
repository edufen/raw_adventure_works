with
    creditcard as (
        select
        row_number () over (order by creditcard_id) as creditcard_sk  --surrogate key pra fazer consulta com o fct depois, tem q a dicionar isso em tds dims
        , creditcard_id
        , card_number
        , card_type
        from {{ ref('stg_erp__creditcard') }}
    )

select * from creditcard