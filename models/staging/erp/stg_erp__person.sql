with source as (
    select distinct
        businessentityid as businessentity_id
        , firstname as first_name
        , middlename as middle_name
        , lastname as last_name
        , persontype as person_type
        , emailpromotion as email_promotion		
		, rowguid
		, CAST(modifieddate as DATETIME) as modified_date			
    from {{ source('AdventureWorks','person')}}
)

select * from source 