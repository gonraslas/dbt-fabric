with raw_almacen as (

    select
        id_almacen,
        nombre_almacen,
        latitud,
        longitud
    from {{ source('operational_data', 'Almacen') }}

)

select
    id_almacen,
    upper(nombre_almacen) as nombre_almacen,
    latitud,
    longitud
from raw_almacen