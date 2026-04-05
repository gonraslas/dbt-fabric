with recepcion as (
    select
        id_recepcion,
        fecha_prevista,
        fecha_recepcion,
        id_estado_recepcion,
        id_proveedor,
        id_almacen
    from {{ ref("slv_recepcion") }}
), estado_recepcion as (
    select
        id_estado_recepcion,
        descripcion
    from {{ ref("slv_estado_recepcion") }}
)
select
    rcp.id_recepcion,
    rcp.fecha_prevista,
    rcp.fecha_recepcion,
    rcp.id_proveedor,
    rcp.id_almacen
    estrec.descripcion as estado_recepcion
from recepcion rcp
inner join estado_recepcion estrec on rcp.id_estado_recepcion = estrec.id_estado_recepcion
