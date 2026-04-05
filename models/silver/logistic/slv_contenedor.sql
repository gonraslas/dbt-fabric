with contenedor as (

    select
        id_contenedor,
        id_ubicacion,
        id_envio,
        id_recepcion,
        ref_contenedor
    from {{ ref("brz_contenedor") }}

)

select
    id_contenedor,
    id_ubicacion,
    id_envio,
    id_recepcion,
    ref_contenedor
from contenedor