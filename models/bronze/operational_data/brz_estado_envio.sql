with raw_estado as (

    select
        id_estado_envio,
        descripcion
    from {{ source('operational_data', 'EstadoEnvio') }}

)

select
    id_estado_envio,
    upper(descripcion) as descripcion
from raw_estado