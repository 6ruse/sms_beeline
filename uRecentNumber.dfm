object FrmRecentNumber: TFrmRecentNumber
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' '#1085#1086#1084#1077#1088#1072
  ClientHeight = 164
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 342
    Height = 164
    Align = alClient
    Caption = #1042#1099#1073#1080#1088#1072#1077#1084' '#1085#1091#1078#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1080' '#1076#1086#1083#1073#1080#1084' '#1087#1086' '#1085#1077#1084#1091' '#1083#1077#1074#1086#1081' '#1082#1085#1086#1087#1082#1086#1081' '#1084#1099#1096#1080
    TabOrder = 0
    object ListPhone: TListBox
      Left = 2
      Top = 15
      Width = 338
      Height = 147
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnDblClick = ListPhoneDblClick
    end
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'Contakt'
    StorageManager = frmMain.RegPropStorageManEh1
    StoredProps.Strings = (
      'GroupBox1.ListPhone.<P>.Items.Strings')
    AfterLoadProps = PropStorageEh1AfterLoadProps
    BeforeLoadProps = PropStorageEh1BeforeLoadProps
    Left = 168
    Top = 40
  end
end
