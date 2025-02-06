CREATE VIEW vw_ordem_servico AS
SELECT 
    t1.id_ordem_servico,
    t1.data_hora_cadastro,
    t1.id_entidade_cliente,
    t2.nome,
    t2.bairro,
    t2.logradouro,
    t2.numero_endereco,
    t2.fone_primario_nome_contato,
    t3.uf,
    t3.nome AS Cidade,
    t2.cep,
    t2.fone_primario_ddd,
    t2.fone_primario_numero,
    t2.fone_secundario_ddd,
    t2.email,
    t1.observacao,
    dbo.FormatarCpfCnpj(CASE WHEN t4.cpf IS NOT NULL THEN t4.cpf WHEN t5.cnpj IS NOT NULL THEN t5.cnpj END) AS CPFCNPJ,
    CASE WHEN t4.rg IS NOT NULL THEN t4.rg WHEN t5.ie IS NOT NULL THEN t5.ie END AS RGIE
FROM 
    ordem_servico t1 WITH (NOLOCK)
    LEFT JOIN entidade t2 WITH (NOLOCK) ON t1.id_entidade_cliente = t2.id_entidade
    LEFT JOIN cidade t3 WITH (NOLOCK) ON t2.id_cidade = t3.id_cidade
    LEFT JOIN pessoa_fisica t4 WITH (NOLOCK) ON t1.id_entidade_cliente = t4.id_entidade
    LEFT JOIN pessoa_juridica t5 WITH (NOLOCK) ON t1.id_entidade_cliente = t5.id_entidade;
