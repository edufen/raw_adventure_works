with source as (
    select
    businessentityid as businessentity_id
    , personid as person_id

    from {{ source('AdventureWorks', 'businessentitycontact') }}
)

select * from source 