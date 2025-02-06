object DmCadastroServicos: TDmCadastroServicos
  OldCreateOrder = False
  Height = 72
  Width = 208
  object QServicos: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      'Select t1.id_servico,t1.nome,t1.preco,t2.sigla,'
      'CASE WHEN t1.situacao = 0 then '#39'ATIVO'#39' else '#39'INATIVO'#39' END ATIVO'
      'from servico t1'
      
        'left join unidade_medida t2 on t2.id_unidade_medida = t1.id_unid' +
        'ade_medida'
      'where t1.id_servico like :codservico or t1.nome like :nome ')
    Params = <
      item
        DataType = ftInteger
        Name = 'codservico'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    Left = 40
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codservico'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
  end
  object QCadEdit: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    Params = <>
    Left = 128
    Top = 16
  end
end
