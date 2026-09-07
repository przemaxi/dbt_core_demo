{{ config(
    materialized='incremental',
    unique_key='id'
) }}

select
    id,
    name
from {{ ref('inc_test_table2') }} -- odwołanie do Twojego pliku CSV w seeds

/* 

--to zadziala gdy jest kolumna updated_at i czyta tylko wiersze spelniajace warunek a nie caly plik (wydajnosc!!)
{% if is_incremental() %}
  where updated_at > (select max(updated_at) from {{ this }})
{% endif %}

--alternatywna wersja przy strategii only append:
{% if is_incremental() %}
  -- Filtrujemy po ID zamiast po dacie updated_at
  where id > (select max(id) from {{ this }})
{% endif %}
UWAGA! Bez podawania parametru unique_key. 
Brak unique_key oznacza automatycznie strategię append w dbt

*/
