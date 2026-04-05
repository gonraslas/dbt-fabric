with raw_transportista as (

    select
        id_transportista,
        descripcion
    from {{ source('operational_data', 'Transportista') }}

)

select
    id_transportista,
    upper(descripcion) as descripcion
from raw_transportista