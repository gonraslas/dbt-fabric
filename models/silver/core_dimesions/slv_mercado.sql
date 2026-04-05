with mercado as (

    select
        id_mercado,
        descripcion
    from {{ ref("brz_mercado") }}

)

select
    id_mercado,
    descripcion
from mercado