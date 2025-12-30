{{
    config(
        materialized = 'view'
    )
}}

with source as (
    select
        id_cidades,
        initcap(cidade) as nome_cidade,
        id_estados,
        data_inclusao,
        coalesce(data_atualizacao, data_inclusao) as data_atualizacao
    from {{source('sources','cidades')}}
)

select
    * 
from source