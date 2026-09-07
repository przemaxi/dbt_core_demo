{{ config(materialized='table') }}

with dokumenty as (
    select * from {{ ref('stg_dokumenty') }}
),

pozycje as (
    select * from {{ ref('stg_pozycje') }}
)

select
    d.dok_id,
    d.kom,
    p.p_dok_lp,
    p.opis
from dokumenty as d
left join pozycje as p on d.dok_id = p.dok_id
