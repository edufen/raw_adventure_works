with
    customer as (
        select
        customer_id
        , person_id
        , territory_id
        from {{ ref('stg_erp__customer') }}
    )

    , person as (
        select
        businessentity_id
        , first_name || ' ' || last_name as name
        , person_type
        from {{ ref('stg_erp__person') }}
    )

    , joined as (
        select
        customer.customer_id
        , customer.territory_id
        , person.businessentity_id
        , person.name
        , person.person_type
        from customer
        left join person on customer.person_id = person.businessentity_id
    )

    select * from joined