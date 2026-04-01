with raw_articulo as (

    select
        id_articulo,
        ref_articulo,
        descripcion,
        peso,
        volumen,
        id_mercado
    from {{ source('operational_data', 'Articulo') }}

)

select
    id_articulo,
    ref_articulo,
    descripcion,
    peso,
    volumen,
    id_mercado
from raw_articulo