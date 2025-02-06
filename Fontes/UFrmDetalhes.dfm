object FrmDetalhe: TFrmDetalhe
  Left = 0
  Top = 0
  Caption = 'Detalhe da Ordem de Servi'#231'o'
  ClientHeight = 227
  ClientWidth = 476
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
  PixelsPerInch = 96
  TextHeight = 13
  object btnConfirmar: TBitBtn
    Left = 58
    Top = 184
    Width = 120
    Height = 35
    Caption = 'Confirmar ( F3 )'
    TabOrder = 0
    OnClick = btnConfirmarClick
  end
  object btnFechar: TBitBtn
    Left = 310
    Top = 184
    Width = 120
    Height = 35
    Caption = 'Fechar ( ESC )'
    TabOrder = 1
    OnClick = btnFecharClick
  end
  object grpDetalhes: TGroupBox
    Left = 8
    Top = 8
    Width = 460
    Height = 170
    Caption = '  Dados Gerais  '
    TabOrder = 2
    object lblOrdem: TLabel
      Left = 16
      Top = 71
      Width = 130
      Height = 18
      Caption = 'N'#250'mero interno OS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSituacao: TLabel
      Left = 81
      Top = 120
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
    object lblFilial: TLabel
      Left = 81
      Top = 27
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
    object EdtOrdem: TEdit
      Left = 152
      Top = 67
      Width = 249
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cbSituacao: TComboBox
      Left = 152
      Top = 117
      Width = 249
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
        'FINALIZADA'
        'OR'#199'AMENTO'
        'OR'#199'AMENTO PERDIDO')
    end
    object cbFilial: TComboBox
      Left = 152
      Top = 24
      Width = 249
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
      Text = 'TCM MANUTEN'#199#195'O'
      Items.Strings = (
        'TCM MANUTEN'#199#195'O'
        'SETA VISTORIA'
        '')
    end
  end
  object BtnImprimir: TBitBtn
    Left = 184
    Top = 184
    Width = 120
    Height = 35
    Caption = 'Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BtnImprimirClick
  end
end
