with    
    stg_clientes as (
        select 
        id_cliente
        , nome_cliente
        , empresa_cliente
        , endereco_cliente
        , cep_cliente
        , cidade_cliente
        , regiao_cliente
        , pais_cliente
        from {{ ref('stg_erp__clientes') }}
    )

select *
from stg_clientes