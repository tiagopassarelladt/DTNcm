object Form5: TForm5
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Demo Lista NCM API Siscomex'
  ClientHeight = 349
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Memo1: TMemo
    Left = 0
    Top = 39
    Width = 570
    Height = 310
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 306
    Top = 8
    Width = 96
    Height = 25
    Cursor = crHandPoint
    Caption = 'Listar NCMS'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 408
    Top = 8
    Width = 154
    Height = 25
    Cursor = crHandPoint
    Caption = 'Gerar Script de atualiza'#231#227'o'
    TabOrder = 2
    OnClick = Button2Click
  end
  object DTNcm1: TDTNcm
    Left = 216
    Top = 128
  end
end
