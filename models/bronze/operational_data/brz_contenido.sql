with raw_contenido as (

    select
        id_contenedor,
        id_articulo,
        num_unidades,
        precio_unidad
    from {{ source('operational_data', 'Contenido') }}

)

select
    id_contenedor,
    id_articulo,
    num_unidades,
    precio_unidad
from raw_contenido