with estado_recepcion as (

    select
        id_estado_recepcion,
        descripcion
    from {{ ref("brz_estado_recepcion") }}

)

select
    id_estado_recepcion,
    descripcion
from estado_recepcion