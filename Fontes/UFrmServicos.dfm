object FrmServicos: TFrmServicos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Servi'#231'os'
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
  OnCreate = FormCreate
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
    Caption = '    Pesquisa r'#225'pida (c'#243'digo ou nome do servi'#231'o )  '
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
  object dbgrdServicos: TDBGrid
    Left = 8
    Top = 79
    Width = 664
    Height = 226
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
    Columns = <
      item
        Expanded = False
        FieldName = 'id_servico'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
        Width = 320
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Title.Alignment = taCenter
        Title.Caption = 'Pre'#231'o'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sigla'
        Title.Alignment = taCenter
        Title.Caption = 'Unidade'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATIVO'
        Title.Alignment = taCenter
        Title.Caption = 'Situa'#231#227'o'
        Width = 97
        Visible = True
      end>
  end
  object btnNovo: TBitBtn
    Left = 8
    Top = 311
    Width = 120
    Height = 30
    Caption = 'Novo Servi'#231'o'
    TabOrder = 2
    OnClick = btnNovoClick
  end
  object btnAlterar: TBitBtn
    Left = 134
    Top = 311
    Width = 120
    Height = 30
    Caption = 'Alterar'
    TabOrder = 3
    OnClick = btnAlterarClick
  end
  object btnSelecionar: TBitBtn
    Left = 552
    Top = 345
    Width = 120
    Height = 30
    Caption = 'Selecionar (ENTER)'
    TabOrder = 4
    OnClick = btnSelecionarClick
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
  object DtsServicos: TDataSource
    DataSet = DmCadastroServicos.QServicos
    Left = 464
    Top = 176
  end
end
