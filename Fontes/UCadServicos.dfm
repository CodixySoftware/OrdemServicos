object FrmCadServicos: TFrmCadServicos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Servi'#231'o'
  ClientHeight = 317
  ClientWidth = 539
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
    Left = 232
    Top = 261
    Width = 120
    Height = 35
    Caption = 'Fechar ( ESC )'
    TabOrder = 0
    OnClick = btnFecharClick
  end
  object btnConfirmar: TBitBtn
    Left = 96
    Top = 261
    Width = 120
    Height = 35
    Caption = 'Confirmar ( F3 )'
    TabOrder = 1
    OnClick = btnConfirmarClick
  end
  object grpGeral: TGroupBox
    Left = 8
    Top = 8
    Width = 489
    Height = 201
    TabOrder = 2
    object lblDescricao: TLabel
      Left = 16
      Top = 24
      Width = 60
      Height = 16
      Caption = 'Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblValor: TLabel
      Left = 41
      Top = 72
      Width = 35
      Height = 16
      Caption = 'Valor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtDescricao: TDBEdit
      Left = 82
      Top = 23
      Width = 335
      Height = 21
      DataField = 'nome'
      DataSource = dtsServicos
      TabOrder = 0
    end
    object edtValor: TcxDBCurrencyEdit
      Left = 82
      Top = 67
      DataBinding.DataField = 'preco'
      DataBinding.DataSource = FrmServicos.DtsServicos
      Properties.DisplayFormat = '0.00;-R$ ,0.00'
      TabOrder = 1
      Width = 121
    end
    object chkAtivo: TDBCheckBox
      Left = 327
      Top = 69
      Width = 97
      Height = 17
      Caption = 'Ativo'
      DataField = 'situacao_1'
      DataSource = dtsServicos
      TabOrder = 2
      ValueChecked = '0'
      ValueUnchecked = '1'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 143
      Top = 137
      Width = 218
      Height = 21
      DataField = 'id_categoria'
      DataSource = dtsServicos
      KeyField = 'id_categoria_ordem_servico'
      ListField = 'nome'
      ListFieldIndex = 1
      ListSource = dtsCategoria
      TabOrder = 3
    end
    object JvDBLookupCombo1: TJvDBLookupCombo
      Left = 112
      Top = 164
      Width = 249
      Height = 33
      DataField = 'id_categoria'
      DataSource = dtsServicos
      LookupField = 'id_categoria_ordem_servico'
      LookupDisplay = 'nome'
      LookupSource = dtsCategoria
      TabOrder = 4
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 56
      Top = 104
      DataBinding.DataField = 'id_categoria'
      DataBinding.DataSource = dtsServicos
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsEditList
      Properties.KeyFieldNames = 'id_categoria_ordem_servico'
      Properties.ListColumns = <
        item
          FieldName = 'nome'
        end>
      Properties.ListSource = dtsCategoria
      TabOrder = 5
      Width = 145
    end
  end
  object dtsServicos: TDataSource
    DataSet = FrmServicos.qryServicos
    Left = 448
    Top = 256
  end
  object dtsCategoria: TDataSource
    DataSet = FrmServicos.qryCategoria
    Left = 456
    Top = 168
  end
end
