object dmImpressao: TdmImpressao
  OldCreateOrder = False
  Height = 139
  Width = 167
  object qryServicos: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'SELECT * FROM vw_servicos_ordem_servico')
    Left = 24
    Top = 16
    object qryServicosid_servico: TIntegerField
      FieldName = 'id_servico'
      Required = True
    end
    object qryServicosid_ordem_servico: TIntegerField
      FieldName = 'id_ordem_servico'
      Required = True
    end
    object qryServicosnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryServicosValorUnit: TFMTBCDField
      FieldName = 'ValorUnit'
      currency = True
      Precision = 38
      Size = 2
    end
    object qryServicosquantidade: TBCDField
      FieldName = 'quantidade'
      Required = True
      Precision = 12
      Size = 3
    end
    object qryServicossigla: TStringField
      FieldName = 'sigla'
      Size = 6
    end
    object qryServicosTotal: TFloatField
      FieldName = 'Total'
      ReadOnly = True
      currency = True
    end
  end
  object qryProdutos: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'Select * from vw_produtos_ordem_servico')
    Left = 104
    Top = 16
    object qryProdutosid_produto: TIntegerField
      FieldName = 'id_produto'
      Required = True
    end
    object qryProdutosnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryProdutosvalor_unitario: TBCDField
      FieldName = 'valor_unitario'
      Required = True
      currency = True
      Precision = 12
      Size = 2
    end
    object qryProdutosquantidade: TBCDField
      FieldName = 'quantidade'
      Required = True
      Precision = 12
      Size = 3
    end
    object qryProdutossigla: TStringField
      FieldName = 'sigla'
      Size = 6
    end
    object qryProdutosvalor_total: TBCDField
      FieldName = 'valor_total'
      Required = True
      currency = True
      Precision = 12
      Size = 2
    end
    object qryProdutosid_ncm: TStringField
      FieldName = 'id_ncm'
      Size = 10
    end
    object qryProdutosid_ordem_servico: TIntegerField
      FieldName = 'id_ordem_servico'
      Required = True
    end
  end
  object qryOrdem: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'Select * from vw_ordem_servico')
    Left = 24
    Top = 72
  end
  object qryObjetos: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'Select * from vw_objetos_ordem_servico')
    Left = 104
    Top = 72
  end
end
