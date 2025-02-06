object FrmBuscaProduto: TFrmBuscaProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 379
  ClientWidth = 680
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
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object grpServicos: TGroupBox
    Left = 8
    Top = 8
    Width = 664
    Height = 65
    Caption = '    Pesquisa r'#225'pida (c'#243'digo ou nome do Produto )  '
    TabOrder = 0
    object edtPesquisa: TEdit
      Left = 16
      Top = 24
      Width = 633
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
  object btnNovo: TBitBtn
    Left = 8
    Top = 311
    Width = 120
    Height = 30
    Caption = 'Novo Produto'
    TabOrder = 2
  end
  object btnAlterar: TBitBtn
    Left = 134
    Top = 311
    Width = 120
    Height = 30
    Caption = 'Alterar'
    TabOrder = 3
  end
  object btnExcluir: TBitBtn
    Left = 260
    Top = 311
    Width = 120
    Height = 30
    Caption = 'Excluir'
    TabOrder = 4
  end
  object btnFechar: TBitBtn
    Left = 552
    Top = 311
    Width = 120
    Height = 30
    Caption = 'Fechar (ESC)'
    TabOrder = 5
    OnClick = btnFecharClick
  end
  object btnSelecionar: TBitBtn
    Left = 552
    Top = 345
    Width = 120
    Height = 30
    Caption = 'Selecionar (ENTER)'
    TabOrder = 6
    OnClick = btnSelecionarClick
  end
  object dbgrdProduto: TDBGrid
    Left = 8
    Top = 79
    Width = 664
    Height = 226
    DataSource = DtsProduto
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgrdProdutoDblClick
    OnKeyDown = dbgrdProdutoKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'id_produto'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Produto'
        Width = 318
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sigla'
        Title.Alignment = taCenter
        Title.Caption = 'UN'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco_venda'
        Title.Alignment = taCenter
        Title.Caption = 'Pre'#231'o Venda'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_ncm'
        Title.Alignment = taCenter
        Title.Caption = 'NCM'
        Width = 84
        Visible = True
      end>
  end
  object DtsProduto: TDataSource
    DataSet = qryCadastroProduto
    Left = 472
    Top = 200
  end
  object qryCadastroProduto: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'SELECT '
      '    t1.id_produto, '
      '    t1.nome, '
      '    t2.sigla, '
      '    t1.preco_venda, '
      '    t1.id_ncm'
      'FROM '
      '    produto t1'
      'LEFT JOIN '
      
        '    unidade_medida t2 ON t2.id_unidade_medida = t1.id_unidade_me' +
        'dida'
      'WHERE '
      '    t1.id_produto LIKE :pesquisa '
      '    OR t1.nome LIKE :pesquisa;')
    Left = 432
    Top = 312
    ParamData = <
      item
        Name = 'PESQUISA'
        ParamType = ptInput
        Value = Null
      end>
  end
end
