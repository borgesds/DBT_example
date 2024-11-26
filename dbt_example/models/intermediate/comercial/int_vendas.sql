{{
    config(
        tags=['comercial']
    )
}}

with orders as (
    SELECT 
        extract(month from order_date) as mes,
        extract(year from order_date) as ano,
        freight as total_frete
    FROM {{ ref('stg_orders') }}
),
vendas as (
    SELECT
        mes,
        ano,
        SUM(total_frete) as total_frete
    FROM orders
    GROUP BY
        mes,
        ano
)

SELECT *
FROM vendas

