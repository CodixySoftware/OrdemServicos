object DmExportar: TDmExportar
  OldCreateOrder = False
  Height = 94
  Width = 113
  object QExport: TZQuery
    Connection = DmPrincipal.ConnPrincipal
    SQL.Strings = (
      'Use Hiper'
      
        'select id_ordem_servico,id_cliente,nome, VProduto, VServico, (VP' +
        'roduto + VServico) as VTotal,Situacao,data_hora_cadastro,id_fili' +
        'al,nome_filial'
      'FROM ('
      
        'Select t1.id_ordem_servico,t1.id_entidade_cliente as id_cliente,' +
        't4.nome,case when t1.situacao = 0 then '#39'Pendente'#39' when t1.situac' +
        'ao = 1 then '#39'Cancelada'#39' when t1.situacao = 2 then '#39'Finalizada'#39
      
        'when t1.situacao = 3 then '#39'Faturada'#39' end as Situacao,t1.data_hor' +
        'a_cadastro,'
      
        '(select ISNULL(SUM(t2.valor_total), 0) From item_ordem_servico t' +
        '2 Where t2.id_ordem_servico = t1.id_ordem_servico ) as VProduto,'
      
        '(select ISNULL(SUM(t3.valor_total), 0) From servico_ordem_servic' +
        'o t3 Where t3.id_ordem_servico = t1.id_ordem_servico) as VServic' +
        'o,t1.id_filial,'
      
        'case when t1.id_filial = 1 then '#39'SETA'#39' when t1.id_filial = 2 the' +
        'n '#39'TCM'#39' Else '#39'S/FILIAL'#39' end as nome_filial'
      'From ordem_servico t1'
      
        'left join entidade t4 (NOLOCK) on t1.id_entidade_cliente = t4.id' +
        '_entidade'
      
        'where (t1.data_hora_cadastro BETWEEN :datainicial and :datafinal' +
        ') and (t1.situacao = :situacaoOrdemServico OR (t1.situacao IN(0,' +
        '1,2,3) and :situacaoOrdemServico = 4))'
      
        'AND (t1.id_filial = :idfilial or ((t1.id_filial in (1,2) or t1.i' +
        'd_filial is null) and :idfilial = 0))) As Q')
    Params = <
      item
        DataType = ftDateTime
        Name = 'datainicial'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'datafinal'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'situacaoOrdemServico'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idfilial'
        ParamType = ptInput
      end>
    Left = 40
    Top = 24
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'datainicial'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'datafinal'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'situacaoOrdemServico'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idfilial'
        ParamType = ptInput
      end>
  end
end
