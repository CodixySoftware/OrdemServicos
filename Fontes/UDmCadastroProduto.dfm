object DmCadastroProduto: TDmCadastroProduto
  OldCreateOrder = False
  Height = 84
  Width = 122
  object QCadProdutos: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      'select t1.id_produto, t1.nome,t2.sigla,t1.preco_venda,t1.id_ncm'
      'from produto t1 (nolock)'
      
        'left join unidade_medida t2(NOLOCK) on t2.id_unidade_medida = t1' +
        '.id_unidade_medida'
      'where id_produto like :codproduto or t1.nome like :nomeproduto')
    Params = <
      item
        DataType = ftInteger
        Name = 'codproduto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeproduto'
        ParamType = ptInput
      end>
    Left = 40
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codproduto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeproduto'
        ParamType = ptInput
      end>
    object intgrfldQCadProdutosid_produto: TIntegerField
      FieldName = 'id_produto'
      ReadOnly = True
    end
    object wdstrngfldQCadProdutosnome: TWideStringField
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object wdstrngfldQCadProdutossigla: TWideStringField
      FieldName = 'sigla'
      Required = True
      Size = 6
    end
    object fltfldQCadProdutospreco_venda: TFloatField
      FieldName = 'preco_venda'
      Required = True
      currency = True
    end
    object wdstrngfldQCadProdutosid_ncm: TWideStringField
      FieldName = 'id_ncm'
      Required = True
      Size = 10
    end
  end
end
