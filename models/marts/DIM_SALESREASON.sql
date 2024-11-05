select *
from {{ ref('int_salesreason_prep') }}
where salesorder_id is not Null 