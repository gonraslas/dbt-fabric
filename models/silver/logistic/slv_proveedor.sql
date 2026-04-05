with proveedor as (
    select
        id_proveedor,
        descripcion
    from {{ ref("brz_proveedor") }}
)

select
    id_proveedor,
    descripcion
from proveedor