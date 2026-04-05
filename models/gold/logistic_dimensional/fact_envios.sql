with envio as (
    select
        id_envio,
        id_transportista,
        fecha_prevista,
        fecha_envio,
        id_estado_envio,
        id_tienda,
        tipo_preparacion
    from {{ ref("slv_envio") }}

), 
estado_envio as (
    select
        id_estado_envio,
        descripcion
    from {{ ref("slv_estado_envio") }}
)
select
    env.id_envio,
    env.id_transportista,
    env.fecha_prevista,
    env.fecha_envio,
    env.id_tienda,
    env.tipo_preparacion,
    estenv.descripcion as estado_envio
from envio env
inner join estado_envio estenv on env.id_estado_envio = estenv.id_estado_envio
