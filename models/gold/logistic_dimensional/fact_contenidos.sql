with contenedor as (
    select
        id_contenedor,
        id_ubicacion,
        id_envio,
        id_recepcion,
        ref_contenedor
    from {{ ref("slv_contenedor") }}
),
contenido as (
    select
        id_contenedor,
        id_articulo,
        num_unidades,
        precio_unidad
    from {{ ref("slv_contenido") }}
)
select
    cnt.id_contenedor,
    cnt.id_ubicacion,
    cnt.id_envio,
    cnt.id_recepcion,
    cnt.ref_contenedor,
    cntdo.id_articulo,
    cntdo.num_unidades,
    cntdo.precio_unidad
from contenedor cnt
inner join contenido cntdo on cnt.id_contenedor = cntdo.id_contenedor