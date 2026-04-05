with raw_tipo_ubicacion as (
    select
        id_tipo_ubicacion,
        tipo_ubicacion
    from {{ source('operational_data', 'TipoUbicacion') }}
)

select
    id_tipo_ubicacion,
    upper(tipo_ubicacion) as tipo_ubicacion
from raw_tipo_ubicacion