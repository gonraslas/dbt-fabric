with raw_recepcion as (

    select
        id_recepcion,
        fecha_prevista,
        fecha_recepcion,
        id_estado_recepcion,
        id_proveedor,
        id_almacen
    from {{ source('operational_data', 'Recepcion') }}

)

select
    id_recepcion,
    fecha_prevista,
    fecha_recepcion,
    id_estado_recepcion,
    id_proveedor,
    id_almacen
from raw_recepcion