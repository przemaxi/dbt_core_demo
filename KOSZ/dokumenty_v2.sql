{{ config(
    materialized='table'
) }}

with dok as (
    select dok_id, kom
    from crafty-chiller-504711-m7.test_data_set.dok
),
p_dok as (
    select dok_id, p_dok_lp, opis
    from crafty-chiller-504711-m7.test_data_set.p_dok
)
select dok.dok_id, dok.kom, p_dok.p_dok_lp, p_dok.opis
from dok 
left join p_dok on dok.dok_id = p_dok.dok_id