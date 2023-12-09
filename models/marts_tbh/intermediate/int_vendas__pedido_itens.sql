with
    stg_ordens as (
        select 
            id_pedido
            , id_funcionario
            , id_cliente
            , id_transportadora
            , data_do_pedido
            , frete
            , destinatario
            , endereco_destinatario
            , cep_destinatario
            , cidade_destinatario
            , regiao_destinatario
            , pais_destinatario
            , data_do_envio
            , data_requerida_entrega
        from {{ ref('stg_erp__ordens') }}
    )

    , stg_ordem_detalhes as (
        select 
            id_pedido
            , id_produto
            , desconto_perc
            , preco_da_unidade
            , quantidade
        from {{ ref('stg_erp__ordem_detalhes') }}
    )

    , joined_tabelas as (
    select 
        stg_ordens.id_pedido
        , stg_ordens.id_funcionario
        , stg_ordens.id_cliente
        , stg_ordens.id_transportadora
        , stg_ordem_detalhes.id_produto
        , stg_ordens.data_do_pedido
        , stg_ordens.frete
        , stg_ordens.destinatario
        , stg_ordens.endereco_destinatario
        , stg_ordens.cep_destinatario
        , stg_ordens.cidade_destinatario
        , stg_ordens.regiao_destinatario
        , stg_ordens.pais_destinatario
        , stg_ordens.data_do_envio
        , stg_ordens.data_requerida_entrega        
        , stg_ordem_detalhes.desconto_perc
        , stg_ordem_detalhes.preco_da_unidade
        , stg_ordem_detalhes.quantidade
    from stg_ordem_detalhes
    left join stg_ordens on 
    stg_ordem_detalhes.id_pedido = stg_ordens.id_pedido
    )

    , criar_chave as (
        select
            cast (id_pedido as string) || '-' || cast (id_produto as string) as sk_pedido_item
            , *
        from joined_tabelas

    )

select *
from criar_chave
