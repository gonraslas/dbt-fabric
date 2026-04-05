with ubicacion as (
    select
        id_ubicacion,
        ref_ubicacion,
        id_almacen,
        id_tipo_ubicacion
    from {{ ref("brz_ubicacion") }}
)

select
    id_ubicacion,
    upper(ref_ubicacion) as ref_ubicacion,
    id_almacen,
    id_tipo_ubicacion
from ubicacion