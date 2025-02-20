object FrmDetalhe: TFrmDetalhe
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Detalhe da Ordem de Servi'#231'o'
  ClientHeight = 263
  ClientWidth = 492
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
    Left = 50
    Top = 220
    Width = 120
    Height = 35
    Caption = 'Confirmar ( F3 )'
    TabOrder = 0
    OnClick = btnConfirmarClick
  end
  object btnFechar: TBitBtn
    Left = 302
    Top = 220
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
    Height = 193
    Caption = '  Dados Gerais  '
    TabOrder = 2
    object lblOrdem: TLabel
      Left = 16
      Top = 71
      Width = 128
      Height = 18
      Caption = 'N'#250'mero OS Cliente:'
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
    object Label1: TLabel
      Left = 93
      Top = 153
      Width = 53
      Height = 19
      Caption = 'Motivo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
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
      Text = 'Pendente'
      OnSelect = cbSituacaoSelect
      Items.Strings = (
        'Pendente'
        'Finalizada')
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
    object cbMotivo: TComboBox
      Left = 152
      Top = 150
      Width = 249
      Height = 27
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      Items.Strings = (
        '')
    end
  end
  object BtnImprimir: TBitBtn
    Left = 176
    Top = 220
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
