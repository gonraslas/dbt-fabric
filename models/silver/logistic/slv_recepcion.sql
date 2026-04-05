with recepcion as (

    select
        id_recepcion,
        fecha_prevista,
        fecha_recepcion,
        id_estado_recepcion,
        id_proveedor,
        id_almacen
    from {{ ref("brz_recepcion") }}

)

select
    id_recepcion,
    fecha_prevista,
    fecha_recepcion,
    id_estado_recepcion,
    id_proveedor,
    id_almacen
from recepcion