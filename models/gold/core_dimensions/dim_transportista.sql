with transportista as (

    select
        id_transportista,
        descripcion
    from {{ ref("slv_transportista") }}

)

select
    id_transportista,
    descripcion
from transportista