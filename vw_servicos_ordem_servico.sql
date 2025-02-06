CREATE VIEW vw_servicos_ordem_servico AS
SELECT 
    t1.id_servico,
	t1.id_ordem_servico,
    t2.nome,
    SUM(t1.valor_unitario + t1.valor_acrescimo_total) AS ValorUnit,
    t1.quantidade,
    t3.sigla,
    CAST(t1.valor_total AS FLOAT) AS Total
FROM 
    servico_ordem_servico t1
    LEFT JOIN servico t2 WITH (NOLOCK) ON t1.id_servico = t2.id_servico
    LEFT JOIN unidade_medida t3 WITH (NOLOCK) ON t2.id_unidade_medida = t3.id_unidade_medida
GROUP BY 
    t1.id_servico, t2.nome, t1.quantidade, t3.sigla, t1.valor_total;
