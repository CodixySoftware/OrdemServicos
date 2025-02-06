object DmServicos: TDmServicos
  OldCreateOrder = False
  Height = 90
  Width = 375
  object QServicos: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      'select * from servico_ordem_servico')
    Params = <>
    Left = 40
    Top = 16
    object intgrfldQServicosid_servico_ordem_servico: TIntegerField
      FieldName = 'id_servico_ordem_servico'
      ReadOnly = True
    end
    object intgrfldQServicosid_ordem_servico: TIntegerField
      FieldName = 'id_ordem_servico'
      Required = True
    end
    object intgrfldQServicosid_servico: TIntegerField
      FieldName = 'id_servico'
      Required = True
    end
    object fltfldQServicosquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object fltfldQServicosvalor_unitario: TFloatField
      FieldName = 'valor_unitario'
      Required = True
    end
    object fltfldQServicosvalor_total: TFloatField
      FieldName = 'valor_total'
      Required = True
    end
    object fltfldQServicosvalor_desconto_total: TFloatField
      FieldName = 'valor_desconto_total'
      Required = True
    end
    object fltfldQServicosvalor_acrescimo_total: TFloatField
      FieldName = 'valor_acrescimo_total'
      Required = True
    end
    object QServicosid_usuario_tecnico: TSmallintField
      FieldName = 'id_usuario_tecnico'
      Required = True
    end
    object wdstrngfldQServicoshash_md5: TWideStringField
      FieldName = 'hash_md5'
      Required = True
      Size = 32
    end
  end
  object QServicoGeral: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      'Select id_servico,nome,preco'
      'from servico'
      'where id_servico = :codservico')
    Params = <
      item
        DataType = ftInteger
        Name = 'codservico'
        ParamType = ptInput
      end>
    Left = 128
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codservico'
        ParamType = ptInput
      end>
  end
  object QGridServico: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      
        'select t1.id_servico_ordem_servico, t1.id_servico,t2.nome,t3.sig' +
        'la as Sigla,t1.quantidade,t1.valor_unitario,t1.valor_total'
      'from servico_ordem_servico t1'
      'left join servico t2 on t2.id_servico = t1.id_servico'
      
        'left join unidade_medida t3 on t3.id_unidade_medida = t2.id_unid' +
        'ade_medida'
      'where id_ordem_servico = :id_ordem')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_ordem'
        ParamType = ptInput
      end>
    Left = 208
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_ordem'
        ParamType = ptInput
      end>
    object intgrfldQGridServicoid_servico_ordem_servico: TIntegerField
      FieldName = 'id_servico_ordem_servico'
      ReadOnly = True
    end
    object intgrfldQGridServicoid_servico: TIntegerField
      FieldName = 'id_servico'
      Required = True
    end
    object wdstrngfldQGridServiconome: TWideStringField
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object wdstrngfldQGridServicoSigla: TWideStringField
      FieldName = 'Sigla'
      Required = True
      Size = 6
    end
    object fltfldQGridServicoquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object fltfldQGridServicovalor_unitario: TFloatField
      FieldName = 'valor_unitario'
      Required = True
      currency = True
    end
    object fltfldQGridServicovalor_total: TFloatField
      FieldName = 'valor_total'
      Required = True
      currency = True
    end
  end
  object QEditServico: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    Params = <>
    Left = 288
    Top = 16
  end
end
