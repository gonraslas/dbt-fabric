with raw_contenedor as (

    select
        id_contenedor,
        id_ubicacion,
        id_envio,
        id_recepcion,
        ref_contenedor
    from {{ source('operational_data', 'Contenedor') }}

)

select
    id_contenedor,
    id_ubicacion,
    id_envio,
    id_recepcion,
    upper(ref_contenedor) as ref_contenedor
from raw_contenedor