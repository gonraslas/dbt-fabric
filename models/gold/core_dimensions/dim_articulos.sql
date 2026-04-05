with articulo as (
    select
        id_articulo,
        ref_articulo,
        descripcion,
        peso,
        volumen,
        id_mercado
    from {{ref("slv_articulo")}}
), 
mercado as (
    select
            id_mercado,
            descripcion
    from {{ ref("slv_mercado") }}
)
    select
    art.id_articulo,
    art.ref_articulo,
    art.descripcion,
    art.peso,
    art.volumen,
    mrc.descripcion as mercado
    from articulo art
    inner join mercado mrc on art.id_mercado =mrc.id_mercado