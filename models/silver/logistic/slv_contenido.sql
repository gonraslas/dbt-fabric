with contenido as (

    select
        id_contenedor,
        id_articulo,
        num_unidades,
        precio_unidad
    from {{ ref("brz_contenido") }}

)

select
    id_contenedor,
    id_articulo,
    num_unidades,
    precio_unidad
from contenido