CREATE VIEW vw_objetos_ordem_servico AS
SELECT 
    t1.defeito_relatado,
    t1.diagnostico,
	t1.id_ordem_servico,
    t1.Objeto1,
    t1.Objeto2,
    t1.Objeto3,
    t1.Objeto4,
    t1.Objeto5,
    t1.Objeto6,
    t1.Objeto7
FROM 
    objeto_ordem_servico t1 WITH (NOLOCK);
