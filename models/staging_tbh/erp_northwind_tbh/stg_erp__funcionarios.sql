with
    fonte_funcionarios as (
        select 
            cast (employee_id as int) as id_funcionario
            , cast(reports_to as int) as id_gerente
            , cast(first_name as string) || ' ' || cast(last_name as string) as nome_funcionario           
            , cast(title as string) as cargo_funcionario
            , cast(birth_date as date) as data_nascimento_funcionario
            , cast(hire_date as date) as data_contratacao
            , cast(city as string) as cidade_funcionario
            , cast(region as string) as regiao_funcionario
            , cast(country as string) as pais_funcionario
            , cast(notes as string) as informacoes_funcionario           
            --, photo_path
            --, title_of_courtesy
            --, address
            --, postal_code
            --, home_phone
            --, extension
            --, photo
        from {{ source('erp', 'employees') }}
    )

select *
from fonte_funcionarios