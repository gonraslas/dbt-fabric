with estado_envio as (

    select
        id_estado_envio,
        descripcion
    from {{ ref("brz_estado_envio") }}

)

select
    id_estado_envio,
    upper(descripcion) as descripcion
from estado_envio