with source as (
    select * from {{ source('bq_tables', 'dok') }}
)
select
    dok_id,
    kom -- ` kom` as kom 
from source
