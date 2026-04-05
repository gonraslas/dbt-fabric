with tienda as (

    select
        id_tienda,
        descripcion,
        latitud,
        longitud
    from {{ ref("brz_tienda") }}

)

select
    id_tienda,
    descripcion,
    latitud,
    longitud
from tienda