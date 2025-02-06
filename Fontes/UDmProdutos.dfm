object DmProdutos: TDmProdutos
  OldCreateOrder = False
  Height = 82
  Width = 361
  object QProdutos: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      'Select * from item_ordem_servico')
    Params = <>
    Left = 32
    Top = 16
    object intgrfldQProdutosid_item_ordem_servico: TIntegerField
      FieldName = 'id_item_ordem_servico'
      ReadOnly = True
    end
    object intgrfldQProdutosid_ordem_servico: TIntegerField
      FieldName = 'id_ordem_servico'
      Required = True
    end
    object intgrfldQProdutosid_produto: TIntegerField
      FieldName = 'id_produto'
      Required = True
    end
    object QProdutosid_variacao: TSmallintField
      FieldName = 'id_variacao'
      Required = True
    end
    object wdstrngfldQProdutoscodigo_barras: TWideStringField
      FieldName = 'codigo_barras'
      Required = True
      Size = 14
    end
    object fltfldQProdutosquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object fltfldQProdutosvalor_unitario: TFloatField
      FieldName = 'valor_unitario'
      Required = True
      currency = True
    end
    object fltfldQProdutosvalor_total: TFloatField
      FieldName = 'valor_total'
      Required = True
      currency = True
    end
    object fltfldQProdutosvalor_desconto_total: TFloatField
      FieldName = 'valor_desconto_total'
      Required = True
    end
    object fltfldQProdutosvalor_acrescimo_total: TFloatField
      FieldName = 'valor_acrescimo_total'
      Required = True
    end
    object wdstrngfldQProdutoshash_md5: TWideStringField
      FieldName = 'hash_md5'
      Required = True
      Size = 32
    end
    object wdstrngfldQProdutosobservacao: TWideStringField
      FieldName = 'observacao'
      Size = 255
    end
    object wdstrngfldQProdutosnumero_serie: TWideStringField
      FieldName = 'numero_serie'
      Required = True
      Size = 30
    end
    object QProdutosid_usuario_vendedor: TSmallintField
      FieldName = 'id_usuario_vendedor'
    end
  end
  object QEditProduto: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    Params = <>
    Left = 296
    Top = 16
  end
  object QGridProduto: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      
        'select t1.id_item_ordem_servico,t1.id_produto,t2.nome,t1.quantid' +
        'ade,t1.valor_unitario,t1.valor_desconto_total,t1.valor_acrescimo' +
        '_total,'
      't1.valor_total'
      'from item_ordem_servico t1(NOLOCK)'
      'left join produto t2(NOLOCK) on t2.id_produto = t1.id_produto'
      'where id_ordem_servico = :id_ordem')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_ordem'
        ParamType = ptInput
      end>
    Left = 216
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_ordem'
        ParamType = ptInput
      end>
    object QGridProdutoid_item_ordem_servico: TIntegerField
      FieldName = 'id_item_ordem_servico'
      ReadOnly = True
    end
    object QGridProdutoid_produto: TIntegerField
      FieldName = 'id_produto'
      Required = True
    end
    object QGridProdutonome: TWideStringField
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object QGridProdutoquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object QGridProdutovalor_unitario: TFloatField
      FieldName = 'valor_unitario'
      Required = True
      currency = True
    end
    object QGridProdutovalor_desconto_total: TFloatField
      FieldName = 'valor_desconto_total'
      Required = True
      currency = True
    end
    object QGridProdutovalor_acrescimo_total: TFloatField
      FieldName = 'valor_acrescimo_total'
      Required = True
      currency = True
    end
    object QGridProdutovalor_total: TFloatField
      FieldName = 'valor_total'
      Required = True
      currency = True
    end
  end
  object QProdutoGeral: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      
        'Select t1.id_produto,t1.nome,t1.preco_venda,t2.id_variacao,t3.co' +
        'digo_barras'
      'from produto t1(NOLOCK)'
      
        'left join produto_variacao t2(NOLOCK) on t2.id_produto = t1.id_p' +
        'roduto'
      
        'left join produto_sinonimo t3(NOLOCK) on t3.id_produto = t1.id_p' +
        'roduto'
      
        'where t1.situacao = 1 and t1.id_produto = :codproduto or t3.codi' +
        'go_barras = :codproduto')
    Params = <
      item
        DataType = ftString
        Name = 'codproduto'
        ParamType = ptInput
      end>
    Left = 120
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'codproduto'
        ParamType = ptInput
      end>
  end
end
