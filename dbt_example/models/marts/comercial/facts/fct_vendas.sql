{{
    config(
        tags=['comercial']
    )
}}

with vendas as (
    SELECT *
    FROM {{ ref('int_vendas') }}
)

SELECT *
FROM vendas
