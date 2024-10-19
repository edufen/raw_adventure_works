with
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
    , salesorderdetail as (
        select
        salesorderdetail_id
        , salesorder_id
        , specialoffer_id
        , product_id
        , unit_price
        , order_quantity
        , unitprice_discount
        from {{ ref('stg_erp__salesorderdetail') }}
    )
    , salesorderheader as (
        select
        salesorder_id
        , currencyrate_id
        , creditcard_id
        , territory_id
        , customer_id
        , purchaseorder_number
        , creditcardapproval_code
        , order_date
        , ship_date
        , due_date
        , subtotal
        , total_due
        , tax_amt
        , status
        from {{ ref('stg_erp__salesorderheader') }}
    )
    , salesorderheadersalesreason as (
        select
        salesorder_id
        , salesreason_id
        from {{ ref('stg_erp__salesorderheadersalesreason') }}
    )
    , specialoffer as (
        select       
        specialoffer_id
        , type
        , category
        , discount_pct
        , start_date
        , end_date
        , min_quantity
        , max_quantity
        from {{ ref('stg_erp__specialoffer') }}
    )
    , currencyrate as (
        select
        currencyrate_id
        , from_currency_code
        , to_currency_code
        , average_rate
        from {{ ref('stg_erp__currencyrate') }}
    )
    , ordersdetail as (
        select
        salesorderdetail.salesorderdetail_id
        , salesorderdetail.salesorder_id
        , salesorderdetail.specialoffer_id
        , salesorderdetail.product_id
        , product.product_name
        , salesorderdetail.unit_price
        , salesorderdetail.order_quantity
        , salesorderdetail.unitprice_discount
        , product.standard_cost
        , specialoffer.type
        , specialoffer.category
        , specialoffer.discount_pct
        from salesorderdetail
        left join product on salesorderdetail.product_id = product.product_id
        left join specialoffer on salesorderdetail.specialoffer_id = specialoffer.specialoffer_id
    )
    , ordersheader as (
        select
        salesorderheader.salesorder_id
        , salesorderheader.customer_id
        , salesorderheader.creditcard_id
        , salesorderheader.territory_id
        , salesorderheader.currencyrate_id
        , salesorderheader.purchaseorder_number
        , salesorderheader.creditcardapproval_code
        , salesorderheader.order_date
        , salesorderheader.ship_date
        , salesorderheader.due_date
        , salesorderheader.subtotal
        , salesorderheader.total_due
        , salesorderheader.tax_amt
        , salesorderheader.status
        from salesorderheader
        left join customer on salesorderheader.customer_id = customer.customer_id
    )
    
select * from ordersheader

