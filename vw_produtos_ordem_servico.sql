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
FROM 
    item_ordem_servico t1
    LEFT JOIN produto t2 WITH (NOLOCK) ON t1.id_produto = t2.id_produto
    LEFT JOIN unidade_medida t3 WITH (NOLOCK) ON t2.id_unidade_medida = t3.id_unidade_medida;
