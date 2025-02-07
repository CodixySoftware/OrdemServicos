object FrmServicos: TFrmServicos
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cadastro de Servi'#231'os'
  ClientHeight = 562
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
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = -3
    Top = 45
    Width = 234
    Height = 13
    Caption = '    Pesquisa r'#225'pida (c'#243'digo ou nome do servi'#231'o )  '
  end
  object dbgrdServicos: TDBGrid
    Left = 8
    Top = 116
    Width = 830
    Height = 366
    DataSource = DtsServicos
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrdServicosDrawColumnCell
    OnDblClick = dbgrdServicosDblClick
    OnKeyDown = dbgrdServicosKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'id_servico'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Title.Caption = 'Pre'#231'o R$'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sigla'
        Title.Caption = 'Unid.'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'situacao'
        Title.Caption = 'Situacao'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'categoria'
        Title.Caption = 'Categoria'
        Width = 64
        Visible = True
      end>
  end
  object btnNovo: TBitBtn
    Left = 8
    Top = 488
    Width = 120
    Height = 30
    Caption = 'Novo Servi'#231'o'
    TabOrder = 1
    OnClick = btnNovoClick
  end
  object btnAlterar: TBitBtn
    Left = 134
    Top = 488
    Width = 120
    Height = 30
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = btnAlterarClick
  end
  object btnSelecionar: TBitBtn
    Left = 718
    Top = 524
    Width = 120
    Height = 30
    Caption = 'Selecionar (ENTER)'
    TabOrder = 3
    OnClick = btnSelecionarClick
  end
  object btnFechar: TBitBtn
    Left = 718
    Top = 488
    Width = 120
    Height = 30
    Caption = 'Fechar (ESC)'
    TabOrder = 4
    OnClick = btnFecharClick
  end
  object scGPPanel3: TscGPPanel
    Left = 0
    Top = 0
    Width = 846
    Height = 34
    Align = alTop
    FluentUIOpaque = False
    TabOrder = 5
    BlurBackground = False
    BlurBackgroundAmount = 5
    BackgroundStyle = gppbsColor
    ContentMarginLeft = 0
    ContentMarginRight = 0
    ContentMarginTop = 0
    ContentMarginBottom = 0
    CustomImageIndex = -1
    DragForm = True
    DragTopForm = True
    DrawTextMode = scdtmGDI
    FillGradientAngle = 90
    FillGradientBeginAlpha = 255
    FillGradientEndAlpha = 255
    FillGradientBeginColorOffset = 25
    FillGradientEndColorOffset = 25
    FrameWidth = 0
    FillColor = 10114859
    FillColorAlpha = 255
    FillColor2 = clNone
    FrameColor = clBtnShadow
    FrameColorAlpha = 255
    FrameRadius = 0
    ShowCaption = False
    CaptionGlowEffect.Enabled = False
    CaptionGlowEffect.Color = clBtnShadow
    CaptionGlowEffect.AlphaValue = 255
    CaptionGlowEffect.GlowSize = 7
    CaptionGlowEffect.Offset = 0
    CaptionGlowEffect.Intensive = True
    CaptionGlowEffect.StyleColors = True
    Color = 10114859
    Caption = 'scGPPanel2'
    TransparentBackground = False
    StorePaintBuffer = False
    Sizeable = False
    WallpaperIndex = -1
    WordWrap = False
    object scGPGlyphButton9: TscGPGlyphButton
      AlignWithMargins = True
      Left = 801
      Top = 0
      Width = 45
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alRight
      FluentUIOpaque = False
      TabOrder = 0
      OnClick = scGPGlyphButton9Click
      Animation = True
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      Caption = 'CloseButton'
      CanFocused = False
      CustomDropDown = False
      DrawTextMode = scdtmGDI
      FluentLightEffect = False
      Layout = blGlyphLeft
      TransparentBackground = True
      ColorValue = clRed
      Options.NormalColor = clNone
      Options.HotColor = clRed
      Options.PressedColor = clRed
      Options.FocusedColor = clBtnFace
      Options.DisabledColor = clBtnText
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 220
      Options.PressedColorAlpha = 180
      Options.FocusedColorAlpha = 255
      Options.DisabledColorAlpha = 5
      Options.NormalColor2Alpha = 255
      Options.HotColor2Alpha = 255
      Options.PressedColor2Alpha = 255
      Options.FocusedColor2Alpha = 255
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clNone
      Options.FrameHotColor = clNone
      Options.FramePressedColor = clNone
      Options.FrameFocusedColor = clNone
      Options.FrameDisabledColor = clNone
      Options.FrameWidth = 2
      Options.FrameNormalColorAlpha = 70
      Options.FrameHotColorAlpha = 100
      Options.FramePressedColorAlpha = 150
      Options.FrameFocusedColorAlpha = 255
      Options.FrameDisabledColorAlpha = 30
      Options.FontNormalColor = clBtnText
      Options.FontHotColor = clBtnText
      Options.FontPressedColor = clBtnText
      Options.FontFocusedColor = clBtnText
      Options.FontDisabledColor = clBtnShadow
      Options.ShapeFillGradientAngle = 90
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 10
      Options.ShapeStyle = scgpRect
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 2
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      Options.PressedHotColors = False
      GlyphOptions.NormalColor = clWhite
      GlyphOptions.HotColor = clWhite
      GlyphOptions.PressedColor = clWhite
      GlyphOptions.FocusedColor = clWhite
      GlyphOptions.DisabledColor = clWhite
      GlyphOptions.NormalColorAlpha = 255
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 255
      GlyphOptions.DisabledColorAlpha = 100
      GlyphOptions.Kind = scgpbgkClose
      GlyphOptions.Thickness = 1
      GlyphOptions.ThicknessScaled = False
      GlyphOptions.Size = 11
      GlyphOptions.StyleColors = True
      TextMargin = -1
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 0
      AllowAllUp = False
      ToggleMode = False
    end
    object scGPGlyphButton10: TscGPGlyphButton
      AlignWithMargins = True
      Left = 711
      Top = 0
      Width = 45
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alRight
      FluentUIOpaque = False
      TabOrder = 1
      Animation = True
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      Caption = 'scGPGlyphButton1'
      CanFocused = False
      CustomDropDown = False
      DrawTextMode = scdtmGDI
      FluentLightEffect = False
      Layout = blGlyphLeft
      TransparentBackground = True
      ColorValue = clRed
      Options.NormalColor = clWhite
      Options.HotColor = clWhite
      Options.PressedColor = clBlack
      Options.FocusedColor = clWhite
      Options.DisabledColor = clWhite
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 30
      Options.PressedColorAlpha = 50
      Options.FocusedColorAlpha = 255
      Options.DisabledColorAlpha = 5
      Options.NormalColor2Alpha = 255
      Options.HotColor2Alpha = 255
      Options.PressedColor2Alpha = 255
      Options.FocusedColor2Alpha = 255
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clNone
      Options.FrameHotColor = clNone
      Options.FramePressedColor = clNone
      Options.FrameFocusedColor = clNone
      Options.FrameDisabledColor = clNone
      Options.FrameWidth = 2
      Options.FrameNormalColorAlpha = 70
      Options.FrameHotColorAlpha = 100
      Options.FramePressedColorAlpha = 150
      Options.FrameFocusedColorAlpha = 255
      Options.FrameDisabledColorAlpha = 30
      Options.FontNormalColor = clBtnText
      Options.FontHotColor = clBtnText
      Options.FontPressedColor = clBtnText
      Options.FontFocusedColor = clBtnText
      Options.FontDisabledColor = clBtnShadow
      Options.ShapeFillGradientAngle = 90
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 10
      Options.ShapeStyle = scgpRect
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 2
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      Options.PressedHotColors = False
      GlyphOptions.NormalColor = clWhite
      GlyphOptions.HotColor = clWhite
      GlyphOptions.PressedColor = clWhite
      GlyphOptions.FocusedColor = clWhite
      GlyphOptions.DisabledColor = clWhite
      GlyphOptions.NormalColorAlpha = 200
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 255
      GlyphOptions.DisabledColorAlpha = 100
      GlyphOptions.Kind = scgpbgkMinimize
      GlyphOptions.Thickness = 1
      GlyphOptions.ThicknessScaled = False
      GlyphOptions.Size = 14
      GlyphOptions.StyleColors = True
      TextMargin = -1
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 0
      AllowAllUp = False
      ToggleMode = False
    end
    object scLabel7: TscLabel
      Left = 35
      Top = 0
      Width = 676
      Height = 34
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      FluentUIOpaque = False
      TabOrder = 2
      DragForm = True
      DragTopForm = True
      GlowEffect.Enabled = False
      GlowEffect.Color = clBtnShadow
      GlowEffect.AlphaValue = 255
      GlowEffect.GlowSize = 7
      GlowEffect.Offset = 2
      GlowEffect.Intensive = True
      GlowEffect.StyleColors = True
      AutoSize = False
      Alignment = taCenter
      VertAlignment = scvtaCenter
      ShowEllipsis = True
      UseFontColorToStyleColor = True
      Caption = 'Codixy Software - Servi'#231'os'
    end
    object scGPGlyphButton12: TscGPGlyphButton
      AlignWithMargins = True
      Left = 5
      Top = 0
      Width = 30
      Height = 30
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alLeft
      FluentUIOpaque = False
      TabOrder = 3
      Animation = True
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      Caption = 'scGPGlyphButton1'
      CanFocused = False
      CustomDropDown = False
      DrawTextMode = scdtmGDI
      FluentLightEffect = False
      Layout = blGlyphLeft
      TransparentBackground = True
      ColorValue = clRed
      Options.NormalColor = clWhite
      Options.HotColor = clWhite
      Options.PressedColor = clBlack
      Options.FocusedColor = clWhite
      Options.DisabledColor = clWhite
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 30
      Options.PressedColorAlpha = 50
      Options.FocusedColorAlpha = 255
      Options.DisabledColorAlpha = 5
      Options.NormalColor2Alpha = 255
      Options.HotColor2Alpha = 255
      Options.PressedColor2Alpha = 255
      Options.FocusedColor2Alpha = 255
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clNone
      Options.FrameHotColor = clNone
      Options.FramePressedColor = clNone
      Options.FrameFocusedColor = clNone
      Options.FrameDisabledColor = clNone
      Options.FrameWidth = 2
      Options.FrameNormalColorAlpha = 70
      Options.FrameHotColorAlpha = 100
      Options.FramePressedColorAlpha = 150
      Options.FrameFocusedColorAlpha = 255
      Options.FrameDisabledColorAlpha = 30
      Options.FontNormalColor = clBtnText
      Options.FontHotColor = clBtnText
      Options.FontPressedColor = clBtnText
      Options.FontFocusedColor = clBtnText
      Options.FontDisabledColor = clBtnShadow
      Options.ShapeFillGradientAngle = 90
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 10
      Options.ShapeStyle = scgpRect
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 2
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      Options.PressedHotColors = False
      GlyphOptions.NormalColor = clWhite
      GlyphOptions.HotColor = clWhite
      GlyphOptions.PressedColor = clWhite
      GlyphOptions.FocusedColor = clWhite
      GlyphOptions.DisabledColor = clWhite
      GlyphOptions.NormalColorAlpha = 200
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 255
      GlyphOptions.DisabledColorAlpha = 100
      GlyphOptions.Kind = scgpbgkFileNew
      GlyphOptions.Thickness = 1
      GlyphOptions.ThicknessScaled = False
      GlyphOptions.Size = 0
      GlyphOptions.StyleColors = True
      TextMargin = -1
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 0
      AllowAllUp = False
      ToggleMode = False
      ExplicitTop = -24
    end
    object scGPGlyphButton14: TscGPGlyphButton
      AlignWithMargins = True
      Left = 756
      Top = 0
      Width = 45
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alRight
      FluentUIOpaque = False
      TabOrder = 4
      Animation = True
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      Caption = 'scGPGlyphButton1'
      CanFocused = False
      CustomDropDown = False
      DrawTextMode = scdtmGDI
      FluentLightEffect = False
      Layout = blGlyphLeft
      TransparentBackground = True
      ColorValue = clRed
      Options.NormalColor = clWhite
      Options.HotColor = clWhite
      Options.PressedColor = clBlack
      Options.FocusedColor = clWhite
      Options.DisabledColor = clWhite
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 30
      Options.PressedColorAlpha = 50
      Options.FocusedColorAlpha = 255
      Options.DisabledColorAlpha = 5
      Options.NormalColor2Alpha = 255
      Options.HotColor2Alpha = 255
      Options.PressedColor2Alpha = 255
      Options.FocusedColor2Alpha = 255
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clNone
      Options.FrameHotColor = clNone
      Options.FramePressedColor = clNone
      Options.FrameFocusedColor = clNone
      Options.FrameDisabledColor = clNone
      Options.FrameWidth = 2
      Options.FrameNormalColorAlpha = 70
      Options.FrameHotColorAlpha = 100
      Options.FramePressedColorAlpha = 150
      Options.FrameFocusedColorAlpha = 255
      Options.FrameDisabledColorAlpha = 30
      Options.FontNormalColor = clBtnText
      Options.FontHotColor = clBtnText
      Options.FontPressedColor = clBtnText
      Options.FontFocusedColor = clBtnText
      Options.FontDisabledColor = clBtnShadow
      Options.ShapeFillGradientAngle = 90
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 10
      Options.ShapeStyle = scgpRect
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 2
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      Options.PressedHotColors = False
      GlyphOptions.NormalColor = clWhite
      GlyphOptions.HotColor = clWhite
      GlyphOptions.PressedColor = clWhite
      GlyphOptions.FocusedColor = clWhite
      GlyphOptions.DisabledColor = clWhite
      GlyphOptions.NormalColorAlpha = 200
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 255
      GlyphOptions.DisabledColorAlpha = 100
      GlyphOptions.Kind = scgpbgkMaximize
      GlyphOptions.Thickness = 1
      GlyphOptions.ThicknessScaled = False
      GlyphOptions.Size = 13
      GlyphOptions.StyleColors = True
      TextMargin = -1
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 0
      AllowAllUp = False
      ToggleMode = False
    end
  end
  object edtPesquisa: TEdit
    Left = 8
    Top = 64
    Width = 830
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnChange = edtPesquisaChange
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
    object qryServicosid_servico: TFDAutoIncField
      FieldName = 'id_servico'
      Origin = 'id_servico'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryServicosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 60
    end
    object qryServicospreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Required = True
      currency = True
      Precision = 12
      Size = 2
    end
    object qryServicossigla: TStringField
      FieldName = 'sigla'
      Origin = 'sigla'
      ReadOnly = True
      Size = 6
    end
    object qryServicossituacao: TStringField
      FieldName = 'situacao'
      Origin = 'situacao'
      ReadOnly = True
      Required = True
      Size = 7
    end
    object qryServicoscategoria: TStringField
      FieldName = 'categoria'
      Origin = 'categoria'
      ReadOnly = True
      Size = 40
    end
    object qryServicosid_categoria: TIntegerField
      FieldName = 'id_categoria'
      Origin = 'id_categoria'
    end
    object qryServicosid_unidade_medida: TSmallintField
      FieldName = 'id_unidade_medida'
      Origin = 'id_unidade_medida'
      Required = True
    end
    object qryServicosid_classificacao_servico: TSmallintField
      FieldName = 'id_classificacao_servico'
      Origin = 'id_classificacao_servico'
      Required = True
    end
    object qryServicosid_situacao_tributaria_issqn: TSmallintField
      FieldName = 'id_situacao_tributaria_issqn'
      Origin = 'id_situacao_tributaria_issqn'
      Required = True
    end
    object qryServicosaliquota_issqn: TBCDField
      FieldName = 'aliquota_issqn'
      Origin = 'aliquota_issqn'
      Required = True
      Precision = 5
      Size = 2
    end
    object qryServicosfator_base_calculo_issqn: TBCDField
      FieldName = 'fator_base_calculo_issqn'
      Origin = 'fator_base_calculo_issqn'
      Required = True
      Precision = 5
      Size = 2
    end
    object qryServicosid_situacao_tributaria_pis: TSmallintField
      FieldName = 'id_situacao_tributaria_pis'
      Origin = 'id_situacao_tributaria_pis'
      Required = True
    end
    object qryServicosaliquota_pis: TBCDField
      FieldName = 'aliquota_pis'
      Origin = 'aliquota_pis'
      Required = True
      Precision = 5
      Size = 2
    end
    object qryServicosfator_base_calculo_pis: TBCDField
      FieldName = 'fator_base_calculo_pis'
      Origin = 'fator_base_calculo_pis'
      Required = True
      Precision = 5
      Size = 2
    end
    object qryServicosaliquota_pis_st: TBCDField
      FieldName = 'aliquota_pis_st'
      Origin = 'aliquota_pis_st'
      Required = True
      Precision = 5
      Size = 2
    end
    object qryServicosfator_base_calculo_pis_st: TBCDField
      FieldName = 'fator_base_calculo_pis_st'
      Origin = 'fator_base_calculo_pis_st'
      Required = True
      Precision = 5
      Size = 2
    end
    object qryServicosid_situacao_tributaria_cofins: TSmallintField
      FieldName = 'id_situacao_tributaria_cofins'
      Origin = 'id_situacao_tributaria_cofins'
      Required = True
    end
    object qryServicosaliquota_cofins: TBCDField
      FieldName = 'aliquota_cofins'
      Origin = 'aliquota_cofins'
      Required = True
      Precision = 5
      Size = 2
    end
    object qryServicosfator_base_calculo_cofins: TBCDField
      FieldName = 'fator_base_calculo_cofins'
      Origin = 'fator_base_calculo_cofins'
      Required = True
      Precision = 5
      Size = 2
    end
    object qryServicosaliquota_cofins_st: TBCDField
      FieldName = 'aliquota_cofins_st'
      Origin = 'aliquota_cofins_st'
      Required = True
      Precision = 5
      Size = 2
    end
    object qryServicosfator_base_calculo_cofins_st: TBCDField
      FieldName = 'fator_base_calculo_cofins_st'
      Origin = 'fator_base_calculo_cofins_st'
      Required = True
      Precision = 5
      Size = 2
    end
    object qryServicosnatureza_operacao_issqn: TSmallintField
      FieldName = 'natureza_operacao_issqn'
      Origin = 'natureza_operacao_issqn'
      Required = True
    end
    object qryServicossituacao_1: TSmallintField
      FieldName = 'situacao_1'
      Origin = 'situacao'
      Required = True
    end
  end
  object qryCategoria: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'Select * from categoria_ordem_servico')
    Left = 424
    Top = 264
  end
  object tmrPesquisa: TTimer
    Enabled = False
    Interval = 500
    Left = 504
    Top = 376
  end
end
