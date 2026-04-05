with almacen as (
    select
        id_almacen,
        nombre_almacen,
        latitud,
        longitud
    from {{ ref("slv_almacen")}}
),
ubicacion as (
    select
        id_ubicacion,
        ref_ubicacion,
        id_almacen,
        id_tipo_ubicacion
    from {{ ref("slv_ubicacion") }}
),
tipo_ubicacion as (
    select
        id_tipo_ubicacion,
        tipo_ubicacion
    from {{ ref("slv_tipo_ubicacion") }}
)
    select
        ubc.id_ubicacion,
        ubc.ref_ubicacion,
        alm.descripcion as nombre_almacen,
        alm.longitud,
        alm.latitud,
        tubc.tipo_ubicacion as tipo_ubicacion
    from almacen alm
    inner join ubicacion ubc on alm.id_almacen = ubc.id_almacen
    inner join tipo_ubicacion tubc on tubc.id_tipo_ubicacion = ubc.id_tipo_ubicacion