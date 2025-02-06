object FrmExportar: TFrmExportar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'OP'#199#195'O PARA EXPORTA'#199#195'O DE DADOS'
  ClientHeight = 267
  ClientWidth = 425
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
  PixelsPerInch = 96
  TextHeight = 13
  object grpOpcoes: TGroupBox
    Left = 8
    Top = 8
    Width = 409
    Height = 209
    Caption = '   Op'#231#245'es Gerais   '
    TabOrder = 0
    object lblFilial: TLabel
      Left = 74
      Top = 35
      Width = 38
      Height = 19
      Caption = 'Filial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSituacao: TLabel
      Left = 47
      Top = 73
      Width = 65
      Height = 19
      Caption = 'Situa'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPeriodo: TLabel
      Left = 27
      Top = 137
      Width = 85
      Height = 19
      Caption = 'Data Inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblfIM: TLabel
      Left = 36
      Top = 171
      Width = 76
      Height = 19
      Caption = 'Data Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblbusca: TLabel
      Left = 74
      Top = 104
      Width = 38
      Height = 19
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbFilial: TComboBox
      Left = 118
      Top = 37
      Width = 225
      Height = 27
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = '(TODAS)'
      Items.Strings = (
        '(TODAS)'
        'SETA VISTORIA'
        'TCM MANUTEN'#199#195'O')
    end
    object cbSituacao: TComboBox
      Left = 118
      Top = 70
      Width = 225
      Height = 27
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 1
      Text = 'PENDENTE'
      Items.Strings = (
        'PENDENTE'
        'CANCELADA'
        'FINALIZADA'
        'FATURADA'
        '(TODAS)')
    end
    object cbdata: TComboBox
      Left = 118
      Top = 101
      Width = 225
      Height = 27
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = 'EMISS'#195'O'
      Items.Strings = (
        'EMISS'#195'O'
        'FINALIZA'#199#195'O'
        'FATURAMENTO')
    end
    object EdtDataInicial: TDateTimePicker
      Left = 160
      Top = 136
      Width = 186
      Height = 21
      Date = 44530.000000000000000000
      Time = 0.818760219910473100
      TabOrder = 3
    end
    object EdtDataFinal: TDateTimePicker
      Left = 168
      Top = 176
      Width = 186
      Height = 21
      Date = 44530.000000000000000000
      Time = 0.818989479164884000
      TabOrder = 4
    end
  end
  object btnConfirmar: TButton
    Left = 72
    Top = 223
    Width = 120
    Height = 35
    Caption = 'Exportar'
    TabOrder = 1
    OnClick = btnConfirmarClick
  end
  object btnFechar: TButton
    Left = 215
    Top = 223
    Width = 120
    Height = 35
    Caption = 'Fechar (ESC)'
    TabOrder = 2
    OnClick = btnFecharClick
  end
end
