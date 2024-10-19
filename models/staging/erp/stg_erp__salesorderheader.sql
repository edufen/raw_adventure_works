with source as (
    select
        shipmethodid as shipmetod_id
        , salesorderid as salesorder_id
        , billtoaddressid as billtoaddress_id
        , salespersonid as salesperson_id
        , shiptoaddressid as ship_address_id
        , currencyrateid as currencyrate_id
        , creditcardid as creditcard_id
        , territoryid as territory_id
        , customerid as customer_id
        , purchaseordernumber as purchaseorder_number
        , accountnumber as account_number
        , revisionnumber as revision_number
        , creditcardapprovalcode as creditcardapproval_code
        , CAST(orderdate as DATETIME) as order_date
        , CAST(shipdate as  DATETIME) as ship_date
        , CAST(duedate as DATETIME) as due_date
        , subtotal
        , totaldue as total_due
        , taxamt as tax_amt
        , freight
        , status
        , onlineorderflag as onlineorder_flag
    from {{ source('AdventureWorks','salesorderheader')}}
)    
select *
from source
