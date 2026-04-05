with raw_tienda as (

    select
        id_tienda,
        descripcion,
        latitud,
        longitud
    from {{ source('operational_data', 'Tienda') }}

)

select
    id_tienda,
    upper(descripcion) as descripcion,
    latitud,
    longitud
from raw_tienda