{{
    config(
        materialized = 'view'
    )
}}

with source as (
    select

        *
    from {{source('sources','veiculos')}}
)

select
          *
from source