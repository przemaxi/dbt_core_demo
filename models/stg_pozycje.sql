with source as (
    select * from {{ source('bq_tables', 'p_dok') }}
)
select
    dok_id,
    p_dok_lp,
    opis
from source
