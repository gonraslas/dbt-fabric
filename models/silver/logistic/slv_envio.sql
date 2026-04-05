with envio as (

    select
        id_envio,
        id_transportista,
        fecha_prevista,
        fecha_envio,
        id_estado_envio,
        id_tienda,
        tipo_preparacion
    from {{ ref("brz_envio") }}

)

select
    id_envio,
    id_transportista,
    fecha_prevista,
    fecha_envio,
    id_estado_envio,
    id_tienda,
    tipo_preparacion
from envio