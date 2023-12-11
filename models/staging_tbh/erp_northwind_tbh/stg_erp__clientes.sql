with
    fonte_clientes as (
        select 
            cast (customer_id as string) as id_cliente
            , cast (company_name as string) as nome_cliente
            , cast (contact_name as string) as empresa_cliente
            --, cast (contact_title as string) as cargo_do_contato
            , cast (address as string) as endereco_cliente
            , cast (postal_code as string) as cep_cliente
            , cast (city as string) as cidade_cliente
            , cast (region as string) as regiao_cliente
            , cast (country as string) as pais_cliente
            --, cast (phone as string) as 
            --, cast (fax as string) as 
        from {{ source('erp', 'customers') }}
    )

select *
from fonte_clientes