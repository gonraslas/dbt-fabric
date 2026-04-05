with tipo_ubicacion as (
    select
        id_tipo_ubicacion,
        tipo_ubicacion
    from {{ ref("brz_tipo_ubicacion") }}
)

select
    id_tipo_ubicacion,
    tipo_ubicacion
from tipo_ubicacion