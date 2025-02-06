object DmRelatorio: TDmRelatorio
  OldCreateOrder = False
  Height = 87
  Width = 264
  object QServicos: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      'USE HIPER'
      
        'select t1.id_servico, t2.nome,sum(t1.valor_unitario + t1.valor_a' +
        'crescimo_total)As ValorUnit,t1.quantidade,t3.sigla,'
      'CAST(t1.valor_total AS float)as Total'
      'from servico_ordem_servico t1'
      'left join servico t2 (NOLOCK) on t1.id_servico = t2.id_servico'
      
        'left join unidade_medida t3 (NOLOCK) on t2.id_unidade_medida = t' +
        '3.id_unidade_medida'
      'where t1.id_ordem_servico = :idordemservico'
      
        'group by t1.id_servico,t2.nome,t1.quantidade,t3.sigla,t1.valor_t' +
        'otal')
    Params = <
      item
        DataType = ftInteger
        Name = 'idordemservico'
        ParamType = ptInput
      end>
    Left = 16
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idordemservico'
        ParamType = ptInput
      end>
    object intgrfldQServicosid_servico: TIntegerField
      FieldName = 'id_servico'
      Required = True
    end
    object wdstrngfldQServicosnome: TWideStringField
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object fltfldQServicosValorUnit: TFloatField
      FieldName = 'ValorUnit'
      ReadOnly = True
      currency = True
    end
    object fltfldQServicosquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object wdstrngfldQServicossigla: TWideStringField
      FieldName = 'sigla'
      Required = True
      Size = 6
    end
    object fltfldQServicosTotal: TFloatField
      FieldName = 'Total'
      ReadOnly = True
      currency = True
    end
  end
  object QProdutos: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      'USE HIPER'
      
        'select t1.id_produto, t2.nome,t1.valor_unitario,t1.quantidade,t3' +
        '.sigla,t1.valor_total,'
      't2.id_ncm'
      'from item_ordem_servico t1'
      'left join produto t2 (NOLOCK) on t1.id_produto = t2.id_produto'
      
        'left join unidade_medida t3 (NOLOCK) on t2.id_unidade_medida = t' +
        '3.id_unidade_medida'
      'where t1.id_ordem_servico = :idordemservico'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'idordemservico'
        ParamType = ptInput
      end>
    Left = 80
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idordemservico'
        ParamType = ptInput
      end>
    object QProdutosid_produto: TIntegerField
      FieldName = 'id_produto'
      Required = True
    end
    object QProdutosnome: TWideStringField
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object QProdutosvalor_unitario: TFloatField
      FieldName = 'valor_unitario'
      Required = True
      currency = True
    end
    object QProdutosquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object QProdutossigla: TWideStringField
      FieldName = 'sigla'
      Required = True
      Size = 6
    end
    object QProdutosvalor_total: TFloatField
      FieldName = 'valor_total'
      Required = True
      currency = True
    end
    object wdstrngfldQProdutosid_ncm: TWideStringField
      FieldName = 'id_ncm'
      Required = True
      Size = 10
    end
  end
  object QOrdem: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      'USE HIPER'
      
        'Select t1.id_ordem_servico,t1.data_hora_cadastro,t1.id_entidade_' +
        'cliente,t2.nome, t2.bairro,t2.logradouro,t2.numero_endereco,t2.f' +
        'one_primario_nome_contato,'
      
        't3.uf,t3.nome as Cidade,t2.cep,t2.fone_primario_ddd,t2.fone_prim' +
        'ario_numero,t2.fone_secundario_ddd,t2.fone_primario_numero,'
      
        't2.email,t1.observacao,dbo.FormatarCpfCnpj(CASE WHEN t4.cpf IS N' +
        'OT NULL THEN t4.cpf WHEN t5.cnpj IS NOT NULL THEN t5.cnpj END) a' +
        's CPFCNPJ,'
      
        'case when t4.rg is not null then t4.rg when t5.ie IS NOT NULL TH' +
        'EN t5.ie end as RGIE'
      'from ordem_servico t1 (NOLOCK)'
      
        'left join entidade t2 (NOLOCK) on t1.id_entidade_cliente = t2.id' +
        '_entidade'
      'left join cidade t3 (NOLOCK) on t2.id_cidade =t3.id_cidade'
      
        'left join pessoa_fisica t4(NOLOCK) on t1.id_entidade_cliente = t' +
        '4.id_entidade'
      
        'left join pessoa_juridica t5(NOLOCK) on t1.id_entidade_cliente =' +
        ' t5.id_entidade'
      'where t1.id_ordem_servico = :idordemservico'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'idordemservico'
        ParamType = ptInput
      end>
    Left = 136
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idordemservico'
        ParamType = ptInput
      end>
    object intgrfldQOrdemid_ordem_servico: TIntegerField
      FieldName = 'id_ordem_servico'
      ReadOnly = True
    end
    object intgrfldQOrdemid_entidade_cliente: TIntegerField
      FieldName = 'id_entidade_cliente'
    end
    object wdstrngfldQOrdemnome: TWideStringField
      FieldName = 'nome'
      Required = True
      Size = 80
    end
    object wdstrngfldQOrdembairro: TWideStringField
      FieldName = 'bairro'
      Required = True
      Size = 80
    end
    object wdstrngfldQOrdemlogradouro: TWideStringField
      FieldName = 'logradouro'
      Required = True
      Size = 80
    end
    object wdstrngfldQOrdemnumero_endereco: TWideStringField
      FieldName = 'numero_endereco'
      Required = True
      Size = 7
    end
    object wdstrngfldQOrdemfone_primario_nome_contato: TWideStringField
      FieldName = 'fone_primario_nome_contato'
      Required = True
      Size = 40
    end
    object wdstrngfldQOrdemuf: TWideStringField
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object wdstrngfldQOrdemCidade: TWideStringField
      FieldName = 'Cidade'
      Required = True
      Size = 80
    end
    object wdstrngfldQOrdemcep: TWideStringField
      FieldName = 'cep'
      Required = True
      Size = 8
    end
    object wdstrngfldQOrdemfone_primario_ddd: TWideStringField
      FieldName = 'fone_primario_ddd'
      Required = True
      Size = 2
    end
    object wdstrngfldQOrdemfone_primario_numero: TWideStringField
      FieldName = 'fone_primario_numero'
      Required = True
      Size = 9
    end
    object wdstrngfldQOrdemfone_secundario_ddd: TWideStringField
      FieldName = 'fone_secundario_ddd'
      Required = True
      Size = 2
    end
    object wdstrngfldQOrdemfone_primario_numero_1: TWideStringField
      FieldName = 'fone_primario_numero_1'
      Required = True
      Size = 9
    end
    object wdstrngfldQOrdememail: TWideStringField
      FieldName = 'email'
      Required = True
      Size = 80
    end
    object wdmfldQOrdemobservacao: TWideMemoField
      FieldName = 'observacao'
      Required = True
      BlobType = ftWideMemo
    end
    object wdstrngfldQOrdemCPFCNPJ: TWideStringField
      FieldName = 'CPFCNPJ'
      ReadOnly = True
      Size = 30
    end
    object wdstrngfldQOrdemRGIE: TWideStringField
      FieldName = 'RGIE'
      ReadOnly = True
      Size = 15
    end
    object dtmfldQOrdemdata_hora_cadastro: TDateTimeField
      FieldName = 'data_hora_cadastro'
      Required = True
    end
  end
  object QObjeto: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      'USE HIPER'
      
        'Select t1.defeito_relatado,t1.diagnostico,t1.Objeto1,t1.Objeto2,' +
        't1.Objeto3,t1.Objeto4,'
      't1.Objeto5,t1.Objeto6,t1.Objeto7'
      'from objeto_ordem_servico t1(NOLOCK)'
      'where t1.id_ordem_servico = :idordemservico'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'idordemservico'
        ParamType = ptInput
      end>
    Left = 192
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idordemservico'
        ParamType = ptInput
      end>
    object wdmfldQObjetodefeito_relatado: TWideMemoField
      FieldName = 'defeito_relatado'
      Required = True
      BlobType = ftWideMemo
    end
    object wdmfldQObjetodiagnostico: TWideMemoField
      FieldName = 'diagnostico'
      Required = True
      BlobType = ftWideMemo
    end
    object wdstrngfldQObjetoObjeto1: TWideStringField
      FieldName = 'Objeto1'
      Size = 30
    end
    object wdstrngfldQObjetoObjeto2: TWideStringField
      FieldName = 'Objeto2'
      Size = 30
    end
    object wdstrngfldQObjetoObjeto3: TWideStringField
      FieldName = 'Objeto3'
      Size = 30
    end
    object wdstrngfldQObjetoObjeto4: TWideStringField
      FieldName = 'Objeto4'
      Size = 30
    end
    object wdstrngfldQObjetoObjeto5: TWideStringField
      FieldName = 'Objeto5'
      Size = 30
    end
    object wdstrngfldQObjetoObjeto6: TWideStringField
      FieldName = 'Objeto6'
      Size = 30
    end
    object wdstrngfldQObjetoObjeto7: TWideStringField
      FieldName = 'Objeto7'
      Size = 30
    end
  end
end
