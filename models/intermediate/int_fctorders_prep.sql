WITH
    address as (
        select *
        from {{ ref('int_address_prep') }}
    )

    , customer as (
        select *
        from {{ ref('int_customer_prep') }}
    )

    , creditcard as (
        select *
        from {{ ref('int_creditcard_prep') }}
    )

    , product as (
        select *
        from {{ ref('int_product_prep') }}
    )

    , salesreason as (
        select *
        from {{ ref('int_salesreason_prep') }}
    )

    , orderdetail as (
        select
        salesorderdetail_id
        , salesorder_id
        , specialoffer_id
        , product_id
        , order_quantity
        , unit_price
        , unitprice_discount
        from {{ ref('stg_erp__salesorderdetail') }}
    )
    , orderheader as (
        select
        salesorder_id
        , ship_address_id as address_id
        , currencyrate_id
        , creditcard_id
        , territory_id
        , customer_id
        , purchaseorder_number
        , creditcardapproval_code
        , ship_date
        , due_date
        , order_date
        , subtotal
        , total_due
        , tax_amt
        , case
            when status = 5 then 'Shipped'
        end as status
        from {{ ref('stg_erp__salesorderheader') }}
        )
    

    , joined as (
        select
        orderheader.salesorder_id
        , orderdetail.salesorderdetail_id
        , customer.customer_sk
        , product.product_sk
        , address.address_sk
        , salesreason.salesreason_sk
        , creditcard.creditcard_sk
        , orderheader.territory_id
        , orderdetail.specialoffer_id
        , CAST(orderheader.order_date as DATE) as order_date
        , CAST(orderheader.ship_date as DATE) as ship_date
        , CAST(orderheader.due_date as DATE) as due
        , orderheader.creditcardapproval_code
        , orderheader.status
        , orderdetail.unit_price
        , orderdetail.order_quantity
        , orderdetail.unitprice_discount
        from orderheader
        left join customer on orderheader.customer_id = customer.customer_id
        left join address on orderheader.address_id = address.address_id
        left join creditcard on orderheader.creditcard_id = creditcard.creditcard_id
        left join orderdetail on orderheader.salesorder_id = orderdetail.salesorder_id
        left join product on orderdetail.product_id = product.product_id
        left join salesreason on orderheader.salesorder_id = salesreason.salesorder_id
    )

    , metrics as (
        select
        *
        , (order_quantity * unit_price) AS subtotal
        , (order_quantity * (unit_price - unitprice_discount)) as total_due
        from joined
    )

select * from metrics 