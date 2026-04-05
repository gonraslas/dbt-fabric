with raw_precio_tienda as (
    select
        id_tienda,
        id_articulo,
        precio_venta,
        fecha_inicio,
        fecha_fin
    from {{ source('operational_data', 'PreciarioTienda') }}
)

select
    id_tienda,
    id_articulo,
    precio_venta,
    fecha_inicio,
    fecha_fin
from raw_precio_tienda