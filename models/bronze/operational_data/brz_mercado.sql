with raw_mercado as (

    select
        id_mercado,
        descripcion
    from {{ source('operational_data', 'Mercado') }}

)

select
    id_mercado,
    upper(descripcion) as descripcion
from raw_mercado