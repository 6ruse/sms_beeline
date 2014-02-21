object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1057#1052#1057' Beeline.kz'
  ClientHeight = 331
  ClientWidth = 311
  Color = clBtnHighlight
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label2: TLabel
    Left = 23
    Top = 16
    Width = 97
    Height = 13
    Caption = '1 '#1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 34
    Top = 40
    Width = 14
    Height = 13
    Caption = '+7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 23
    Top = 80
    Width = 103
    Height = 15
    Caption = '2 '#1042#1072#1096#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077':'
    Transparent = True
  end
  object Label6: TLabel
    Left = 23
    Top = 208
    Width = 34
    Height = 15
    Caption = '3 '#1050#1086#1076':'
    Transparent = True
  end
  object ImageCaptcha: TImage
    Left = 34
    Top = 225
    Width = 70
    Height = 27
    AutoSize = True
    Center = True
    Transparent = True
  end
  object Label3: TLabel
    Left = 218
    Top = 230
    Width = 66
    Height = 15
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1082#1086#1076
    Transparent = True
  end
  object SpeedButton1: TSpeedButton
    Left = 23
    Top = 269
    Width = 83
    Height = 30
    Hint = #1053#1072#1078#1084#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1082#1072#1088#1090#1080#1085#1082#1080'('#1082#1086#1076#1072') '#1076#1083#1103' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1089#1084#1089' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1082#1086#1076
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 112
    Top = 269
    Width = 83
    Height = 30
    Hint = #1053#1072#1078#1084#1080#1090#1077' '#1076#1083#1103' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1089#1084#1089' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton2Click
  end
  object Label8: TLabel
    Left = 0
    Top = 318
    Width = 311
    Height = 13
    Cursor = crHandPoint
    Hint = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089' '#1072#1074#1090#1086#1088#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    Align = alBottom
    Alignment = taCenter
    Caption = 'koder@koder.kz'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    ExplicitLeft = 100
    ExplicitTop = 330
    ExplicitWidth = 78
  end
  object SpeedButton3: TSpeedButton
    Left = 201
    Top = 269
    Width = 83
    Height = 30
    Hint = #1053#1072#1078#1084#1080#1090#1077' '#1076#1083#1103' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1089#1084#1089' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton3Click
  end
  object ComboCod: TComboBox
    Left = 54
    Top = 35
    Width = 66
    Height = 23
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = '705'
    Items.Strings = (
      '705'
      '771'
      '777')
  end
  object MemoSend: TMemo
    Left = 34
    Top = 99
    Width = 250
    Height = 86
    TabOrder = 2
  end
  object EditCapth: TEdit
    Left = 121
    Top = 227
    Width = 91
    Height = 23
    Hint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1089' '#1082#1072#1088#1090#1080#1085#1082#1080
    MaxLength = 5
    NumbersOnly = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1089' '#1082#1072#1088#1090#1080#1085#1082#1080
    OnKeyPress = EditCapthKeyPress
  end
  object CmbPhoneNumber: TComboBox
    Left = 126
    Top = 35
    Width = 158
    Height = 23
    TabOrder = 1
    OnExit = CmbPhoneNumberExit
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    CookieManager = IdCookieManager1
    Left = 32
    Top = 104
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'SMSKA'
    Left = 128
    Top = 80
  end
  object IdCookieManager1: TIdCookieManager
    Left = 176
    Top = 144
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 72
    Top = 120
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'FrmReportSaldoLawyer'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      'CmbPhoneNumber.<P>.ItemIndex'
      'CmbPhoneNumber.<P>.Items')
    Left = 204
    Top = 96
  end
end
