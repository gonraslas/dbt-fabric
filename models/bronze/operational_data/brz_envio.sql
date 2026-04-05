with raw_envio as (

    select
        id_envio,
        id_transportista,
        fecha_prevista,
        fecha_envio,
        id_estado_envio,
        id_tienda,
        tipo_preparacion
    from {{ source('operational_data', 'Envio') }}

)

select
    id_envio,
    id_transportista,
    fecha_prevista,
    fecha_envio,
    id_estado_envio,
    id_tienda,
    upper(tipo_preparacion) as tipo_preparacion
from raw_envio