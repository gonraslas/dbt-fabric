with preciotienda as (
    select
        id_tienda,
        id_articulo,
        precio_venta,
        fecha_inicio,
        fecha_fin
    from {{ ref("brz_precio_tienda") }}
)

select
    id_tienda,
    id_articulo,
    precio_venta,
    fecha_inicio,
    coalesce([fecha_fin],CAST('2999-12-31' AS DATE)) as fecha_fin
from preciotienda