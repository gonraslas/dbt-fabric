with raw_estado as (

    select
        id_estado_recepcion,
        descripcion
    from {{ source('operational_data', 'EstadoRecepcion') }}

)

select
    id_estado_recepcion,
    upper(descripcion) as descripcion
from raw_estado