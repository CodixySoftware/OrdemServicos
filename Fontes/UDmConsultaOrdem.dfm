object DmConsultaOrdem: TDmConsultaOrdem
  OldCreateOrder = False
  Height = 76
  Width = 269
  object QConsultaOrdens: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      'USE HIPER'
      'SELECT * FROM VIEW_CONSULTA_ORDEM')
    Params = <>
    Left = 48
    Top = 16
    object intgrfldQConsultaOrdensid_ordem_servico: TIntegerField
      FieldName = 'id_ordem_servico'
      ReadOnly = True
    end
    object intgrfldQConsultaOrdensid_cliente: TIntegerField
      FieldName = 'id_cliente'
      ReadOnly = True
    end
    object wdstrngfldQConsultaOrdensnome: TWideStringField
      FieldName = 'nome'
      ReadOnly = True
      Size = 80
    end
    object fltfldQConsultaOrdensVProduto: TFloatField
      FieldName = 'VProduto'
      ReadOnly = True
      currency = True
    end
    object fltfldQConsultaOrdensVServico: TFloatField
      FieldName = 'VServico'
      ReadOnly = True
      currency = True
    end
    object fltfldQConsultaOrdensVTotal: TFloatField
      FieldName = 'VTotal'
      ReadOnly = True
      currency = True
    end
    object wdstrngfldQConsultaOrdensSituacao: TWideStringField
      FieldName = 'Situacao'
      ReadOnly = True
      Size = 10
    end
    object dtmfldQConsultaOrdensdata_hora_cadastro: TDateTimeField
      FieldName = 'data_hora_cadastro'
      ReadOnly = True
    end
    object dtmfldQConsultaOrdensdata_hora_faturamento: TDateTimeField
      FieldName = 'data_hora_faturamento'
      ReadOnly = True
    end
    object intgrfldQConsultaOrdensid_filial: TIntegerField
      FieldName = 'id_filial'
      ReadOnly = True
    end
    object wdstrngfldQConsultaOrdensnome_filial: TWideStringField
      FieldName = 'nome_filial'
      ReadOnly = True
      Size = 8
    end
    object wdstrngfldQConsultaOrdensobjeto1: TWideStringField
      FieldName = 'objeto1'
      ReadOnly = True
      Size = 30
    end
    object wdstrngfldQConsultaOrdensobjeto2: TWideStringField
      FieldName = 'objeto2'
      ReadOnly = True
      Size = 30
    end
    object wdstrngfldQConsultaOrdensobjeto3: TWideStringField
      FieldName = 'objeto3'
      ReadOnly = True
      Size = 30
    end
    object wdstrngfldQConsultaOrdensobjeto4: TWideStringField
      FieldName = 'objeto4'
      ReadOnly = True
      Size = 30
    end
    object wdstrngfldQConsultaOrdensobjeto5: TWideStringField
      FieldName = 'objeto5'
      ReadOnly = True
      Size = 30
    end
    object wdstrngfldQConsultaOrdensobjeto6: TWideStringField
      FieldName = 'objeto6'
      ReadOnly = True
      Size = 30
    end
    object wdstrngfldQConsultaOrdensobjeto7: TWideStringField
      FieldName = 'objeto7'
      ReadOnly = True
      Size = 30
    end
    object wdstrngfldQConsultaOrdensidentificacao: TWideStringField
      FieldName = 'identificacao'
      ReadOnly = True
      Size = 40
    end
    object wdstrngfldQConsultaOrdensobjeto_adicional1: TWideStringField
      FieldName = 'objeto_adicional1'
      ReadOnly = True
      Size = 30
    end
    object wdstrngfldQConsultaOrdensobjeto_adicional2: TWideStringField
      FieldName = 'objeto_adicional2'
      ReadOnly = True
      Size = 30
    end
  end
  object Query: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    Params = <>
    Left = 128
    Top = 16
  end
  object QTotais: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      'USE HIPER'
      'Select count(*) as Quantidade,sum(VProduto + VServico) as VTotal'
      'from view_consulta_ordem')
    Params = <>
    Left = 208
    Top = 16
    object fltfldQTotaisVTotal: TFloatField
      FieldName = 'VTotal'
      ReadOnly = True
      currency = True
    end
    object intgrfldQTotaisQuantidade: TIntegerField
      FieldName = 'Quantidade'
      ReadOnly = True
    end
  end
end
