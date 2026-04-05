with proveedor as (
    select
        id_proveedor,
        descripcion
    from {{ ref("slv_proveedor") }}
)

select
    id_proveedor,
    descripcion
from proveedor