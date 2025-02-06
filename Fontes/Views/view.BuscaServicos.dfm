object FrmServicos: TFrmServicos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Servi'#231'os'
  ClientHeight = 523
  ClientWidth = 846
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object grpServicos: TGroupBox
    Left = 8
    Top = 8
    Width = 830
    Height = 65
    Caption = '    Pesquisa r'#225'pida (c'#243'digo ou nome do servi'#231'o )  '
    TabOrder = 0
    object edtPesquisa: TEdit
      Left = 16
      Top = 24
      Width = 793
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtPesquisaChange
    end
  end
  object dbgrdServicos: TDBGrid
    Left = 8
    Top = 79
    Width = 830
    Height = 366
    DataSource = DtsServicos
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgrdServicosDblClick
    OnKeyDown = dbgrdServicosKeyDown
  end
  object btnNovo: TBitBtn
    Left = 8
    Top = 451
    Width = 120
    Height = 30
    Caption = 'Novo Servi'#231'o'
    TabOrder = 2
    OnClick = btnNovoClick
  end
  object btnAlterar: TBitBtn
    Left = 134
    Top = 451
    Width = 120
    Height = 30
    Caption = 'Alterar'
    TabOrder = 3
    OnClick = btnAlterarClick
  end
  object btnSelecionar: TBitBtn
    Left = 718
    Top = 485
    Width = 120
    Height = 30
    Caption = 'Selecionar (ENTER)'
    TabOrder = 4
    OnClick = btnSelecionarClick
  end
  object btnFechar: TBitBtn
    Left = 718
    Top = 451
    Width = 120
    Height = 30
    Caption = 'Fechar (ESC)'
    TabOrder = 5
    OnClick = btnFecharClick
  end
  object DtsServicos: TDataSource
    DataSet = qryServicos
    Left = 344
    Top = 184
  end
  object qryServicos: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'SELECT '
      '    s.id_servico,'
      '    s.nome,'
      '    s.preco,'
      '    COALESCE(u.sigla, '#39'N/A'#39') AS sigla,  -- Tratar nulo da sigla'
      '    CASE '
      '        WHEN s.situacao = 0 THEN '#39'ATIVO'#39' '
      '        ELSE '#39'INATIVO'#39' '
      '    END AS situacao,'
      '    UPPER(COALESCE(c.nome, '#39'N/A'#39')) AS categoria,'
      '    s.id_categoria,'
      '    s.id_unidade_medida,'
      '    s.id_classificacao_servico,'
      '    s.id_situacao_tributaria_issqn,'
      '    s.aliquota_issqn,'
      '    s.fator_base_calculo_issqn,'
      '    s.id_situacao_tributaria_pis,'
      '    s.aliquota_pis,'
      '    s.fator_base_calculo_pis,'
      '    s.aliquota_pis_st,'
      '    s.fator_base_calculo_pis_st,'
      '    s.id_situacao_tributaria_cofins,'
      '    s.aliquota_cofins,'
      '    s.fator_base_calculo_cofins,'
      '    s.aliquota_cofins_st,'
      '    s.fator_base_calculo_cofins_st,'
      '    s.natureza_operacao_issqn,'
      '    s.situacao'
      #9
      'FROM '
      '    servico s'
      'LEFT JOIN '
      
        '    unidade_medida u ON u.id_unidade_medida = s.id_unidade_medid' +
        'a'
      'LEFT JOIN'
      
        '    categoria_ordem_servico c ON c.id_categoria_ordem_servico = ' +
        's.id_categoria'
      'WHERE '
      
        #9'(:pesquisa IS NULL OR s.id_servico LIKE :pesquisa OR s.nome LIK' +
        'E :pesquisa)'
      '')
    Left = 320
    Top = 312
    ParamData = <
      item
        Name = 'PESQUISA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryCategoria: TFDQuery
    Active = True
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'Select * from categoria_ordem_servico')
    Left = 424
    Top = 264
  end
end
