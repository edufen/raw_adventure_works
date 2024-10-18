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

    , businessentity as (
        select
        businessentity_id
        , person_id

        from {{ ref('stg_erp__businessidentitycontact') }}
    )

    , joined as (
        select
        customer.customer_id
        , customer.person_id
        , customer.territory_id
        , person.businessentity_id
        , person.name
        , person.person_type
        from customer
        left join businessentity on customer.person_id = businessentity.person_id
        left join person on businessentity.businessentity_id = person.businessentity_id
    )


    select * from joined
    where name is not null
    limit 50;
