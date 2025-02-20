object DmOrdemServicos: TDmOrdemServicos
  OldCreateOrder = False
  Height = 307
  Width = 488
  object qGerarOrdem: TFDQuery
    Connection = DmPrincipal.connPrincipal
    Left = 112
    Top = 8
  end
  object qBuscaClientes: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      
        'select t1.id_entidade,t1.nome, dbo.FormatarCpfCnpj(CASE WHEN t2.' +
        'cpf IS NOT NULL THEN t2.cpf WHEN t3.cnpj IS NOT NULL THEN t3.cnp' +
        'j END) as CPFCNPJ,'
      
        't1.fone_primario_ddd,t1.fone_primario_numero,t1.fone_secundario_' +
        'ddd,t1.fone_secundario_numero,t1.email,t4.nome+'#39' - '#39'+t4.uf as Ci' +
        'dade,CASE WHEN t1.inativo = 1 then '#39'INATIVO'#39' ELSE '#39'ATIVO'#39' END as' +
        ' SITUACAO'
      'from entidade t1(NOLOCK)'
      
        'LEFT JOIN pessoa_fisica t2(NOLOCK) ON t1.id_entidade = t2.id_ent' +
        'idade'
      
        'LEFT JOIN pessoa_juridica t3(NOLOCK) ON t1.id_entidade = t3.id_e' +
        'ntidade'
      'LEFT JOIN cidade t4(NOLOCK) ON t1.id_cidade = t4.id_cidade'
      'WHERE t1.id_entidade = :codigo')
    Left = 24
    Top = 8
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
      end>
  end
  object qObjeto: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'select * from objeto_ordem_servico'
      'where id_ordem_servico = :idOrdemServico')
    Left = 240
    Top = 80
    ParamData = <
      item
        Name = 'IDORDEMSERVICO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qOrdem: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'use hiper'
      'select observacao, ehOrcamento from ordem_servico'
      'where id_ordem_servico = :idOrdemServico')
    Left = 248
    Top = 16
    ParamData = <
      item
        Name = 'IDORDEMSERVICO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qOrdemServico: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'USE HIPER'
      'SELECT * FROM ORDEM_SERVICO')
    Left = 24
    Top = 64
  end
  object qAtualizaOrdem: TFDQuery
    Connection = DmPrincipal.connPrincipal
    Left = 112
    Top = 64
  end
  object qTotal: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'Use Hiper'
      
        'select id_ordem_servico,vProduto,vServico, (VProduto + VServico)' +
        ' as VTotal'
      'FROM ('
      'Select t1.id_ordem_servico,'
      
        '(select ISNULL(SUM(t2.valor_total), 0) From item_ordem_servico t' +
        '2 Where t2.id_ordem_servico = t1.id_ordem_servico ) as VProduto,'
      
        '(select ISNULL(SUM(t3.valor_total), 0) From servico_ordem_servic' +
        'o t3 Where t3.id_ordem_servico = t1.id_ordem_servico) as VServic' +
        'o'
      'From ordem_servico t1'
      'where t1.id_ordem_servico = :idOrdemServico'
      ') As Q')
    Left = 400
    Top = 24
    ParamData = <
      item
        Name = 'IDORDEMSERVICO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qTotalid_ordem_servico: TFDAutoIncField
      FieldName = 'id_ordem_servico'
      Origin = 'id_ordem_servico'
      ReadOnly = True
    end
    object qTotalvProduto: TFMTBCDField
      FieldName = 'vProduto'
      Origin = 'vProduto'
      ReadOnly = True
      currency = True
      Precision = 38
      Size = 2
    end
    object qTotalvServico: TFMTBCDField
      FieldName = 'vServico'
      Origin = 'vServico'
      ReadOnly = True
      currency = True
      Precision = 38
      Size = 2
    end
    object qTotalVTotal: TFMTBCDField
      FieldName = 'VTotal'
      Origin = 'VTotal'
      ReadOnly = True
      currency = True
      Precision = 38
      Size = 2
    end
  end
  object qryGeneric: TFDQuery
    Connection = DmPrincipal.connPrincipal
    Left = 336
    Top = 16
  end
  object qryServicos: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'SELECT '
      '    s.id_servico,'
      '    s.nome,'
      '    s.preco'
      'FROM '
      '    servico s'
      'WHERE '
      '    s.id_servico = :codServico')
    Left = 24
    Top = 176
    ParamData = <
      item
        Name = 'CODSERVICO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryGridServicos: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'SELECT'
      '    t1.id_servico_ordem_servico,'
      '    t1.id_servico,'
      '    t2.nome,'
      '    t3.sigla AS Sigla,'
      '    t1.quantidade,'
      '    t1.valor_unitario,'
      '    t1.valor_total'
      'FROM'
      '    servico_ordem_servico t1'
      'LEFT JOIN'
      '    servico t2 ON t2.id_servico = t1.id_servico'
      'LEFT JOIN'
      
        '    unidade_medida t3 ON t3.id_unidade_medida = t2.id_unidade_me' +
        'dida'
      'WHERE'
      '    t1.id_ordem_servico = :idOrdemServico')
    Left = 104
    Top = 176
    ParamData = <
      item
        Name = 'IDORDEMSERVICO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryGridServicosid_servico_ordem_servico: TFDAutoIncField
      FieldName = 'id_servico_ordem_servico'
      Origin = 'id_servico_ordem_servico'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryGridServicosid_servico: TIntegerField
      FieldName = 'id_servico'
      Origin = 'id_servico'
      Required = True
    end
    object qryGridServicosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object qryGridServicosSigla: TStringField
      FieldName = 'Sigla'
      Origin = 'Sigla'
      Size = 6
    end
    object qryGridServicosquantidade: TBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
      Precision = 12
      Size = 3
    end
    object qryGridServicosvalor_unitario: TBCDField
      FieldName = 'valor_unitario'
      Origin = 'valor_unitario'
      Required = True
      currency = True
      Precision = 12
      Size = 2
    end
    object qryGridServicosvalor_total: TBCDField
      FieldName = 'valor_total'
      Origin = 'valor_total'
      Required = True
      currency = True
      Precision = 12
      Size = 2
    end
  end
  object qryProdutos: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'WITH ProdutoVariacaoSinonimo AS ('
      
        '    -- Subquery que combina as informa'#231#245'es de produto e suas var' +
        'ia'#231#245'es e sin'#244'nimos'
      '    SELECT'
      '        t1.id_produto,'
      '        t1.nome,'
      '        t1.preco_venda,'
      '        t2.id_variacao,'
      '        t3.codigo_barras'
      '    FROM'
      '        produto t1'
      '    LEFT JOIN'
      '        produto_variacao t2 ON t2.id_produto = t1.id_produto'
      '    LEFT JOIN'
      '        produto_sinonimo t3 ON t3.id_produto = t1.id_produto'
      '    WHERE'
      '        t1.situacao = 1'
      ')'
      '-- Combina'#231#227'o das consultas com UNION ALL para evitar uso de OR'
      'SELECT'
      '    id_produto,'
      '    nome,'
      '    preco_venda,'
      '    id_variacao,'
      '    codigo_barras'
      'FROM'
      '    ProdutoVariacaoSinonimo'
      'WHERE'
      '    id_produto = :codproduto'
      ''
      'UNION ALL'
      ''
      'SELECT'
      '    t1.id_produto,'
      '    t1.nome,'
      '    t1.preco_venda,'
      '    t2.id_variacao,'
      '    t3.codigo_barras'
      'FROM'
      '    produto t1'
      'LEFT JOIN'
      '    produto_variacao t2 ON t2.id_produto = t1.id_produto'
      'LEFT JOIN'
      '    produto_sinonimo t3 ON t3.id_produto = t1.id_produto'
      'WHERE'
      '    t3.codigo_barras = :codproduto;')
    Left = 24
    Top = 240
    ParamData = <
      item
        Name = 'CODPRODUTO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryGridProdutos: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'SELECT'
      '    t1.id_item_ordem_servico,'
      '    t1.id_produto,'
      '    t2.nome,'
      '    t1.quantidade,'
      '    t1.valor_unitario,'
      '    t1.valor_desconto_total,'
      '    t1.valor_acrescimo_total,'
      '    t1.valor_total'
      'FROM'
      '    item_ordem_servico t1'
      'LEFT JOIN'
      '    produto t2 ON t2.id_produto = t1.id_produto'
      'WHERE'
      '    t1.id_ordem_servico = :idOrdemServico')
    Left = 104
    Top = 240
    ParamData = <
      item
        Name = 'IDORDEMSERVICO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryGridProdutosid_item_ordem_servico: TFDAutoIncField
      FieldName = 'id_item_ordem_servico'
      Origin = 'id_item_ordem_servico'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryGridProdutosid_produto: TIntegerField
      FieldName = 'id_produto'
      Origin = 'id_produto'
      Required = True
    end
    object qryGridProdutosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object qryGridProdutosquantidade: TBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
      Precision = 12
      Size = 3
    end
    object qryGridProdutosvalor_unitario: TBCDField
      FieldName = 'valor_unitario'
      Origin = 'valor_unitario'
      Required = True
      currency = True
      Precision = 12
      Size = 2
    end
    object qryGridProdutosvalor_desconto_total: TBCDField
      FieldName = 'valor_desconto_total'
      Origin = 'valor_desconto_total'
      Required = True
      Precision = 12
      Size = 2
    end
    object qryGridProdutosvalor_acrescimo_total: TBCDField
      FieldName = 'valor_acrescimo_total'
      Origin = 'valor_acrescimo_total'
      Required = True
      Precision = 12
      Size = 2
    end
    object qryGridProdutosvalor_total: TBCDField
      FieldName = 'valor_total'
      Origin = 'valor_total'
      Required = True
      currency = True
      Precision = 12
      Size = 2
    end
  end
  object fdTransaction: TFDTransaction
    Connection = DmPrincipal.connPrincipal
    Left = 176
    Top = 136
  end
end
