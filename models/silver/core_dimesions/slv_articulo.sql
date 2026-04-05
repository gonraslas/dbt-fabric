with articulo as (

    select
        id_articulo,
        ref_articulo,
        descripcion,
        peso,
        volumen,
        id_mercado
    from {{ ref("brz_articulo") }}

)

select
    id_articulo,
    ref_articulo,
    descripcion,
    peso,
    volumen,
    id_mercado
from articulo