with tienda as (
    select
        id_tienda
    from {{ ref("slv_tienda") }}
),
envios_recibidos as (
    select
        id_envio,
        id_transportista,
        fecha_envio,
        id_tienda
    from {{ref("fact_envios")}}
    where estado_envio is  ('ENTREGADO')
),
fact_contenidos AS (
    select
        id_envio,
        ref_contenedor,
        id_articulo,
        num_unidades,
        precio_unidad
    from {{ref("fact_contenidos")}}
    where id_envio is not null
),
precio_tienda AS (
    select
        id_tienda,
        id_articulo,
        precio_venta,
        fecha_inicio,
        fecha_fin
    from preciotienda
)
select
    tnd.id_tienda,
    envrec.id_transportista,
    envrec.fecha_envio as fecha_venta,
    envrec.id_transportista,
    fctcntdo.ref_contenedor,
    fctcntdo.id_articulo,
    fctcntdo.num_unidades,
    fctcntdo.precio_unidad,
    prctnd.precio_venta
from tienda tnd
inner join envios_recibidos envrec on tnd.id_tienda = envrec.id_tienda
inner join precio_tienda prctnd on 
tnd.id_tienda = prctnd.id_tienda and 
envrec.fecha_envio between prctnd.fecha_inicio and prctnd.fecha_fin and 
prctnd.id_articulo = fctcntdo.id_articulo
inner join fact_contenidos fctcntdo on fctcntdo.id_envio = envrec.id_envio