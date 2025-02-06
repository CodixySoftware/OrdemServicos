object FrmBuscaCliente: TFrmBuscaCliente
  Left = 0
  Top = 0
  Caption = 'Busca de Clientes'
  ClientHeight = 442
  ClientWidth = 803
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 247
    Width = 129
    Height = 21
    Caption = 'Data da '#250'ltima OS:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 480
    Top = 247
    Width = 108
    Height = 21
    Caption = 'Tipo de Vendas:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblUltimaOS: TLabel
    Left = 143
    Top = 247
    Width = 133
    Height = 21
    Caption = 'Data da '#250'ltima OS:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTipoVenda: TLabel
    Left = 594
    Top = 247
    Width = 116
    Height = 21
    Caption = 'Tipo de Vendas:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object grpBusca: TGroupBox
    Left = 8
    Top = 3
    Width = 787
    Height = 57
    Caption = '  Pesquisa r'#225'pida (c'#243'digo do cliente, nome, CPF ou CNPJ)  '
    TabOrder = 0
    object edtbusca: TEdit
      Left = 16
      Top = 16
      Width = 753
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtbuscaChange
      OnKeyDown = edtbuscaKeyDown
    end
  end
  object btnSelecionar: TButton
    Left = 8
    Top = 399
    Width = 120
    Height = 35
    Caption = 'Selecionar Cliente'
    TabOrder = 2
    OnClick = btnSelecionarClick
  end
  object btnFechar: TButton
    Left = 675
    Top = 399
    Width = 120
    Height = 35
    Caption = 'Fechar Janela '
    TabOrder = 3
    OnClick = btnFecharClick
  end
  object dbgClientes: TDBGrid
    Left = 8
    Top = 66
    Width = 787
    Height = 175
    DataSource = dsClientes
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgClientesCellClick
    OnDblClick = dbgClientesDblClick
    OnKeyDown = dbgClientesKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'id_entidade'
        Title.Caption = 'C'#243'digo'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RazaoSocial'
        Title.Caption = 'Nome'
        Width = 291
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPFCNPJ'
        Title.Caption = 'CPF/CNPJ'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACAO'
        Width = 93
        Visible = True
      end>
  end
  object Memo1: TMemo
    Left = 8
    Top = 274
    Width = 787
    Height = 119
    TabOrder = 4
  end
  object dsClientes: TDataSource
    DataSet = qryClientes
    Left = 416
    Top = 136
  end
  object qryClientes: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'SELECT '
      '    t1.id_entidade,'
      '    t1.nome AS RazaoSocial, '
      '    dbo.FormatarCpfCnpj('
      '        CASE '
      '            WHEN t2.cpf IS NOT NULL THEN t2.cpf '
      '            WHEN t3.cnpj IS NOT NULL THEN t3.cnpj '
      '            ELSE REPLICATE('#39' '#39', 16) '
      '        END'
      '    ) AS CPFCNPJ,'
      '    t4.nome AS Cidade, '
      '    t4.uf,'
      
        '    '#39'('#39' + t1.fone_primario_ddd + '#39') '#39' + t1.fone_primario_numero ' +
        'AS Telefone,'
      '    CASE '
      '        WHEN t1.inativo = 1 THEN '#39'INATIVO'#39' '
      '        ELSE '#39'ATIVO'#39' '
      '    END AS SITUACAO,'
      #9't1.observacao'
      'FROM '
      '    entidade t1'
      'LEFT JOIN '
      '    pessoa_fisica t2 ON t1.id_entidade = t2.id_entidade'
      'LEFT JOIN '
      '    pessoa_juridica t3 ON t1.id_entidade = t3.id_entidade'
      'LEFT JOIN '
      '    cidade t4 ON t1.id_cidade = t4.id_cidade'
      'WHERE '
      '    (t1.id_entidade LIKE :pesquisa OR '
      '     t1.nome LIKE :pesquisa OR '
      '     t3.cnpj LIKE :pesquisa OR '
      '     t2.cpf LIKE :pesquisa);')
    Left = 152
    Top = 128
    ParamData = <
      item
        Name = 'PESQUISA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryUltimaOs: TFDQuery
    Connection = DmPrincipal.connPrincipal
    Left = 296
    Top = 128
  end
end
