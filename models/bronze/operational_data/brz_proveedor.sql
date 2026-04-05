with raw_proveedor as (
    select
        id_proveedor,
        descripcion
    from {{ source('operational_data', 'Proveedor') }}
)

select
    id_proveedor,
    upper(descripcion) as descripcion
from raw_proveedor