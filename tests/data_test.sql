select sum(subtotal)
from {{ ref('int_fctorders_prep') }}
where order_date like '2011%'