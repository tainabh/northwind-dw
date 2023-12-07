with
    stg_funcionarios as (
        select 
            id_funcionario
            , id_gerente
            , nome_funcionario           
            , cargo_funcionario
            , data_nascimento_funcionario
            , data_contratacao
            , cidade_funcionario
            , regiao_funcionario
            , pais_funcionario
            , informacoes_funcionario
        from {{ ref('stg_erp__funcionarios') }}
    )

    , self_join_funcionarios as (
        select
            funcionario.id_funcionario
            , funcionario.id_gerente
            , funcionario.nome_funcionario  
            , gerente.nome_funcionario as nome_gerente         
            , funcionario.cargo_funcionario
            , funcionario.data_nascimento_funcionario
            , funcionario.data_contratacao
            , funcionario.cidade_funcionario
            , funcionario.regiao_funcionario
            , funcionario.pais_funcionario
            , funcionario.informacoes_funcionario            
        from stg_funcionarios as funcionario
        left join stg_funcionarios as gerente on
            funcionario.id_gerente = gerente.id_funcionario
    )
        
select *
from self_join_funcionarios