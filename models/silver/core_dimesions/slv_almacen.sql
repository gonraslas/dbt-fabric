with almacen as (

    select
        id_almacen,
        nombre_almacen,
        latitud,
        longitud
    from {{ ref("brz_almacen")}}

)

select
    id_almacen,
    nombre_almacen,
    latitud,
    longitud
from almacen