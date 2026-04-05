with raw_ubicacion as (
    select
        id_ubicacion,
        ref_ubicacion,
        id_almacen,
        id_tipo_ubicacion
    from {{ source('operational_data', 'Ubicacion') }}
)

select
    id_ubicacion,
    upper(ref_ubicacion) as ref_ubicacion,
    id_almacen,
    id_tipo_ubicacion
from raw_ubicacion