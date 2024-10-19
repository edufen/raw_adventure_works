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
        , ship_address_id as address_id
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
        , product.product_sk
        , salesorderdetail.specialoffer_id
        , salesorderdetail.product_id
        , salesorderdetail.unit_price
        , salesorderdetail.order_quantity
        , salesorderdetail.unitprice_discount
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
        , customer.customer_sk
        , address.address_sk
        , creditcard.creditcard_sk
        , salesorderheader.territory_id
        , salesorderheader.currencyrate_id
        , salesorderheader.purchaseorder_number
        , salesorderheader.creditcardapproval_code
        , salesorderheader.order_date
        , salesorderheader.ship_date
        , salesorderheader.due_date
        , salesorderheader.subtotal
        , salesorderheader.total_due
        , currencyrate.average_rate
        , salesorderheader.tax_amt
        , salesorderheader.status
        , salesreason.name
        , salesreason.reason_type
        from salesorderheader
        left join salesreason on salesorderheader.salesorder_id = salesreason.salesorder_id
        left join address on salesorderheader.address_id = address.address_id
        left join creditcard on salesorderheader.creditcard_id = creditcard.creditcard_id
        left join customer on salesorderheader.customer_id = customer.customer_id
        left join currencyrate on salesorderheader.currencyrate_id = currencyrate.currencyrate_id
    )
    
    , joined as (
        select
        ordersheader.salesorder_id
        , ordersheader.customer_sk
        , ordersheader.address_sk
        , ordersheader.creditcard_sk
        , ordersdetail.product_sk
        , ordersdetail.specialoffer_id
        , ordersdetail.product_id
        , ordersheader.territory_id
        , ordersheader.currencyrate_id
        , ordersheader.purchaseorder_number
        , ordersheader.creditcardapproval_code
        , ordersheader.order_date
        , ordersheader.ship_date
        , ordersheader.due_date
        , ordersheader.subtotal
        , ordersheader.total_due
        , ordersheader.average_rate
        , ordersheader.tax_amt
        , ordersheader.status
        , ordersheader.name
        , ordersheader.reason_type
        , ordersdetail.unit_price
        , ordersdetail.order_quantity
        , ordersdetail.unitprice_discount
        , ordersdetail.type
        , ordersdetail.category
        , ordersdetail.discount_pct
        from ordersdetail
        left join ordersheader on ordersdetail.salesorder_id = ordersheader.salesorder_id
    )
select
    j.customer_sk
    , j.salesorder_id 
    , c.name
from joined j
join customer c on j.customer_sk = c.customer_sk


