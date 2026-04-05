with transportista as (

    select
        id_transportista,
        descripcion
    from {{ ref("brz_transportista") }}

)

select
    id_transportista,
    descripcion
from transportista