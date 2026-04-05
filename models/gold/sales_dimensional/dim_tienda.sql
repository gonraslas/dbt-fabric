with tienda as (

    select
        id_tienda,
        descripcion,
        latitud,
        longitud
    from {{ ref("slv_tienda") }}

)

select
    id_tienda,
    descripcion,
    latitud,
    longitud
from tienda