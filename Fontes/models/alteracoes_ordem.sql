-- Deletar as views existentes, se elas existirem
IF OBJECT_ID('vw_ordem_servico', 'V') IS NOT NULL
    DROP VIEW vw_ordem_servico;
GO

IF OBJECT_ID('vw_objetos_ordem_servico', 'V') IS NOT NULL
    DROP VIEW vw_objetos_ordem_servico;
GO

IF OBJECT_ID('vw_produtos_ordem_servico', 'V') IS NOT NULL
    DROP VIEW vw_produtos_ordem_servico;
GO

IF OBJECT_ID('vw_servicos_ordem_servico', 'V') IS NOT NULL
    DROP VIEW vw_servicos_ordem_servico;
GO


CREATE VIEW vw_ordem_servico AS
SELECT 
    os.id_ordem_servico,
    os.data_hora_cadastro,
    os.id_entidade_cliente,
    e.nome,
    e.bairro,
    e.logradouro,
    e.numero_endereco,
    e.fone_primario_nome_contato,
    c.uf,
    c.nome AS cidade,
    e.cep,
    e.fone_primario_ddd,
    e.fone_primario_numero,
    e.fone_secundario_ddd,
	e.fone_secundario_numero,
    e.email,
    os.observacao,
    dbo.FormatarCpfCnpj(COALESCE(pf.cpf, pj.cnpj)) AS CPFCNPJ,
    COALESCE(pf.rg, pj.ie) AS RGIE
FROM 
    ordem_servico AS os WITH (NOLOCK)
LEFT JOIN 
    entidade AS e WITH (NOLOCK) ON os.id_entidade_cliente = e.id_entidade
LEFT JOIN 
    cidade AS c WITH (NOLOCK) ON e.id_cidade = c.id_cidade
LEFT JOIN 
    pessoa_fisica AS pf WITH (NOLOCK) ON os.id_entidade_cliente = pf.id_entidade
LEFT JOIN 
    pessoa_juridica AS pj WITH (NOLOCK) ON os.id_entidade_cliente = pj.id_entidade;
GO



CREATE VIEW vw_objetos_ordem_servico AS
SELECT 
	t1.id_ordem_servico,
    t1.defeito_relatado,
    t1.diagnostico,
    t1.Objeto1,
    t1.Objeto2,
    t1.Objeto3,
    t1.Objeto4,
    t1.Objeto5,
    t1.Objeto6,
    t1.Objeto7
FROM objeto_ordem_servico t1 WITH (NOLOCK);
GO

USE HIPER;

CREATE VIEW vw_produtos_ordem_servico AS
SELECT 
    t1.id_produto,
    t2.nome,
    t1.valor_unitario,
    t1.quantidade,
    t3.sigla,
    t1.valor_total,
    t2.id_ncm,
	t1.id_ordem_servico
FROM item_ordem_servico t1
LEFT JOIN produto t2 WITH (NOLOCK) ON t1.id_produto = t2.id_produto
LEFT JOIN unidade_medida t3 WITH (NOLOCK) ON t2.id_unidade_medida = t3.id_unidade_medida;
GO


CREATE VIEW vw_servicos_ordem_servico AS
SELECT 
    t1.id_servico,
    t2.nome,
    SUM(t1.valor_unitario + t1.valor_acrescimo_total) AS ValorUnit,
    t1.quantidade,
    t3.sigla,
    CAST(t1.valor_total AS FLOAT) AS Total,
	t1.id_ordem_servico
FROM servico_ordem_servico t1
LEFT JOIN servico t2 WITH (NOLOCK) ON t1.id_servico = t2.id_servico
LEFT JOIN unidade_medida t3 WITH (NOLOCK) ON t2.id_unidade_medida = t3.id_unidade_medida
GROUP BY 
    t1.id_servico,
    t2.nome,
    t1.quantidade,
    t3.sigla,
    t1.valor_total,
	t1.id_ordem_servico;
GO

--Adicionar a coluna para indicar a categoria do serviço
ALTER TABLE servico
ADD  id_categoria INT;

--Adicionar a coluna para indicar o setor de trabalho, que será relacionado com a categoria do serviço
ALTER TABLE usuario
ADD id_categoria INT;


-- Adicionar Tabela de Requisições
USE Hiper;
GO

CREATE TABLE almoxarifado_requisicoes (
    id_requisicao         INT IDENTITY(1,1) PRIMARY KEY,
    id_ordemServico       INT NOT NULL,
    situacao              INT NOT NULL DEFAULT 0, -- Sugestão: adicionar DEFAULT
    id_filial             Smallint NOT NULL,
    id_cliente            INT NOT NULL,
    nome_cliente          VARCHAR(255) NOT NULL,
    dta_cadastro          DATETIME NOT NULL DEFAULT GETDATE(), -- Sugestão: DEFAULT GETDATE()
    dta_finalizacao       DATETIME NULL,
    id_usuario_cadastro   Smallint NOT NULL,
    id_usuario_finalizacao Smallint NULL,
    
    CONSTRAINT FK_almoxarifado_requisicoes_ordemServico FOREIGN KEY (id_ordemServico) REFERENCES ordem_servico(id_ordem_servico),
    CONSTRAINT FK_almoxarifado_requisicoes_filial FOREIGN KEY (id_filial) REFERENCES filial(id_filial),
    CONSTRAINT FK_almoxarifado_requisicoes_cliente FOREIGN KEY (id_cliente) REFERENCES entidade(id_entidade),
    CONSTRAINT FK_almoxarifado_requisicoes_usuario_cadastro FOREIGN KEY (id_usuario_cadastro) REFERENCES usuario(id_usuario),
    CONSTRAINT FK_almoxarifado_requisicoes_usuario_finalizacao FOREIGN KEY (id_usuario_finalizacao) REFERENCES usuario(id_usuario)
);

