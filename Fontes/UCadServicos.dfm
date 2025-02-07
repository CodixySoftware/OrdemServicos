object FrmCadServicos: TFrmCadServicos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Servi'#231'o'
  ClientHeight = 274
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnFechar: TBitBtn
    Left = 252
    Top = 229
    Width = 120
    Height = 35
    Caption = 'Fechar ( ESC )'
    TabOrder = 0
    OnClick = btnFecharClick
  end
  object btnConfirmar: TBitBtn
    Left = 122
    Top = 229
    Width = 120
    Height = 35
    Caption = 'Confirmar ( F3 )'
    TabOrder = 1
    OnClick = btnConfirmarClick
  end
  object grpGeral: TGroupBox
    Left = 8
    Top = 8
    Width = 473
    Height = 201
    TabOrder = 2
    object lblDescricao: TLabel
      Left = 16
      Top = 24
      Width = 60
      Height = 17
      Caption = 'Descri'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblValor: TLabel
      Left = 41
      Top = 72
      Width = 33
      Height = 17
      Caption = 'Valor:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 117
      Width = 60
      Height = 17
      Caption = 'Categoria:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtDescricao: TDBEdit
      Left = 82
      Top = 23
      Width = 375
      Height = 28
      DataField = 'nome'
      DataSource = dtsServicos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtValor: TcxDBCurrencyEdit
      Left = 82
      Top = 62
      DataBinding.DataField = 'preco'
      DataBinding.DataSource = FrmServicos.DtsServicos
      ParentFont = False
      Properties.DisplayFormat = '0.00;-R$ ,0.00'
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 121
    end
    object chkAtivo: TDBCheckBox
      Left = 360
      Top = 67
      Width = 97
      Height = 17
      Caption = 'Ativo'
      DataField = 'situacao_1'
      DataSource = dtsServicos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ValueChecked = '0'
      ValueUnchecked = '1'
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 82
      Top = 112
      DataBinding.DataField = 'id_categoria'
      DataBinding.DataSource = dtsServicos
      ParentFont = False
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsEditList
      Properties.KeyFieldNames = 'id_categoria_ordem_servico'
      Properties.ListColumns = <
        item
          FieldName = 'nome'
        end>
      Properties.ListSource = dtsCategoria
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 231
    end
  end
  object dtsServicos: TDataSource
    DataSet = FrmServicos.qryServicos
    Left = 96
    Top = 168
  end
  object dtsCategoria: TDataSource
    DataSet = FrmServicos.qryCategoria
    Left = 32
    Top = 168
  end
end
